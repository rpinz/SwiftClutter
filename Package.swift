import PackageDescription

let package = Package(
    name: "Clutter",
    dependencies: [
        .Package(url: "https://github.com/rhx/CClutter.git", majorVersion: 1),
        .Package(url: "https://github.com/rhx/SwiftCoglPango.git", majorVersion: 2),
    ]
)
