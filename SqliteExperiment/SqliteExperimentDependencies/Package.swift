// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SqliteExperimentDependencies",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SqliteExperimentDependencies",
            targets: ["SqliteExperimentDependencies"]),
    ],
    dependencies: [
        .package(url: "https://github.com/stephencelis/SQLite.swift.git", from: "0.15.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SqliteExperimentDependencies",
            dependencies: [
                .product(name: "SQLite", package: "SQLite.swift")
            ]),
        .testTarget(
            name: "SqliteExperimentDependenciesTests",
            dependencies: ["SqliteExperimentDependencies"]
        ),
    ]
)
