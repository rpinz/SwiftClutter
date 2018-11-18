import PackageDescription

let package = Package(
    name: "Clutter",
    dependencies: [
        .Package(url: "https://github.com/rpinz/CClutter", majorVersion: 1),
        .Package(url: "https://github.com/rpinz/SwiftCairo", majorVersion: 2),
        .Package(url: "https://github.com/rpinz/SwiftCoglPango", majorVersion: 2),
    ],
    swiftLanguageVersions: [3, 4]
)
