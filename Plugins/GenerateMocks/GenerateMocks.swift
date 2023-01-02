import PackagePlugin
import Foundation

@main
struct SourceryCommand: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        var argExtractor = ArgumentExtractor(arguments)
        let selectedTargets = argExtractor.extractOption(named: "target")

        // Until SPM is more convenient to use, let's filter out obvious Test and Mock targets by hand
        let targetsToRunOn = context
            .package
            .targets
            .filter { !$0.name.contains("Test") }
            .filter { !$0.name.contains("Mock") }
            .filter { selectedTargets.contains($0.name) }

        for target in targetsToRunOn {
            try await runSourcery(context: context, target: target, arguments: arguments)
        }
    }

    func runSourcery(context: PluginContext, target: Target, arguments: [String]) async throws {

        let sourceryExecutable = try context.tool(named: "sourcery")
        let sourceryURL = URL(fileURLWithPath: sourceryExecutable.path.string)

        let templatesPath = sourceryExecutable.path
            .removingLastComponent()
            .removingLastComponent()
            .removingLastComponent()
            .removingLastComponent()
            .appending(subpath: "Templates")

        let process = Process()
        process.executableURL = sourceryURL

        let configPath = context.pluginWorkDirectory.appending(subpath: ".sourcery.yml")
        makeSourceryYaml(at: configPath, for: target, context: context, templatesPath: templatesPath)
        process.arguments = [
            "--disableCache",
            "--config",
            "\(configPath)"
        ]

        try process.run()
        process.waitUntilExit()

        let gracefulExit = process.terminationReason == .exit && process.terminationStatus == 0
        if !gracefulExit {
            Diagnostics.error("🛑 The plugin execution failed")
        }
    }

    typealias SeparatedDependencies = (local: [Target], remote: [Target])
    func getDeps(for target: Target, in context: PluginContext) -> SeparatedDependencies {
        let targetIds = Set(context.package.targets.map { $0.id })

        return target.recursiveTargetDependencies
            .reduce(into: SeparatedDependencies([],[])) { partialResult, target in
                let (local, remote) = partialResult



                partialResult = (
                    local: local + (targetIds.contains(target.id) ? [target] : []),
                    remote: remote + (!targetIds.contains(target.id) ? [target] : [])
                )
            }
    }

    func makeSourceryYaml(at configPath: Path, for target: Target, context: PluginContext, templatesPath: Path) {
        var str = [
            "sources:\n",
            "  - \(target.directory.string)\n",
            "templates:\n",
            //"  - \(context.package.directory.appending(subpath: "/Templates/Mockable.stencil").string)\n",
            "  - \(templatesPath.string)\n",
            "output:\n",
            "  \(context.package.directory.appending(subpath: "/Mocks/\(target.name)/Generated").string)\n",
            "args:\n"
        ]

        str = str + [
            "  testableImports:\n",
            "    - \(target.name)\n"
        ]
        // Assuming we name the mock targets "<Target.name>Mocks"
        let deps = getDeps(for: target, in: context)
        deps.local.forEach {
            str = str + [
                "    - \"\($0.name)Mocks\"\n"
            ]
        }

        let ymlContent = str.reduce("", +)

        print(ymlContent)

        do {
            try ymlContent.write(toFile: configPath.string, atomically: true, encoding: .utf8)
        } catch {
            Diagnostics.error("🛑 Failed to create config file")
            Diagnostics.error(error.localizedDescription)
        }
    }
}
