// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ViciousMockery",
    platforms: [
        .macOS(.v10_15), .iOS(.v9), .tvOS(.v9)
    ],
    products: [
        .library(
            name: "ViciousMockery",
            targets: ["ViciousMockery"]
        ),
        .library(
            name: "Prestidigitation",
            targets: ["Prestidigitation"]
        ),
        .plugin(name: "GenerateMocks", targets: ["GenerateMocks"])
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick", from: "5.0.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "10.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "0.6.1")
    ],
    targets: [
        .target(
            name: "ViciousMockery",
            dependencies: [
                .product(name: "CustomDump", package: "swift-custom-dump")
            ],
            path: "ViciousMockery"
        ),
        .target(
            name: "Prestidigitation",
            dependencies: [],
            path: "Prestidigitation"
        ),
        .plugin(
            name: "GenerateMocks",
            capability: .command(
                intent: .custom(
                    verb: "sourcery-code-generation",
                    description: "Generates Swift files from a given set of inputs"
                ),
                permissions: [.writeToPackageDirectory(reason: "File generation for mocks")]
            ),
            dependencies: ["Sourcery"]
        ),
        .binaryTarget(
            name: "Sourcery",
            path: "Sourcery.artifactbundle"
        ),
        .testTarget(
            name: "ViciousMockeryTests",
            dependencies: [
                "ViciousMockery",
                "Quick",
                "Nimble"
            ]
        ),
        .testTarget(
            name: "PrestidigitationTests",
            dependencies: [
                "ViciousMockery",
                "Prestidigitation",
                "Quick",
                "Nimble"
            ]
        ),
    ]
)
