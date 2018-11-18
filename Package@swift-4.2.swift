// swift-tools-version:4.2

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
            url: "https://github.com/rpinz/SwiftCairo",
            .branch("master")),
        .package(
            url: "https://github.com/rpinz/SwiftCoglPango",
            .branch("master"))
    ],
    targets: [
        .target(
            name: "Clutter",
            dependencies: ["CClutter","Cairo", "CoglPango"],
            path: "Sources"),
        .systemLibrary(
            name: "CClutter",
            path: "Library/CClutter",
            pkgConfig: "clutter-1.0",
            providers: [
                .brew(["libclutter-1.0"]),
                .apt(["libclutter-1.0-dev"])
            ])
    ],
    swiftLanguageVersions: [
        .v4_2
    ]
)
