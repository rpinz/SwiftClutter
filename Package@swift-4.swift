// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Clutter",
    products: [
        .library(
            name: "Clutter",
            targets: ["Clutter"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/rpinz/CClutter",
            .branch("master")),
        .package(
            url: "https://github.com/rpinz/SwiftCairo",
            .branch("master")),
        .package(
            url: "https://github.com/rpinz/SwiftCoglPango",
            .branch("master"))
    ],
    targets: [
        .target(
            name: "Clutter",
            dependencies: ["Cairo", "CoglPango"],
            path: "Sources")
    ],
    swiftLanguageVersions: [4]
)
