// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "mdclip",
    dependencies: [
        .package(url: "https://github.com/johnxnguyen/Down", from: "0.11.0")
    ],
    targets: [
        .executableTarget(
            name: "mdclip",
            dependencies: [
                .product(name: "Down", package: "Down")
            ]),
    ]
)
