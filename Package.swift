// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ViciousMockery",
    platforms: [
        .iOS(.v13)
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
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick", from: "5.0.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "10.0.0")
    ],
    targets: [
        .target(
            name: "ViciousMockery",
            dependencies: [],
            path: "ViciousMockery"
        ),
        .target(
            name: "Prestidigitation",
            dependencies: [],
            path: "Prestidigitation"
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
