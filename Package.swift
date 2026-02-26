// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "mdclip",
    dependencies: [
        .package(url: "https://github.com/KristopherGBaker/libcmark_gfm", from: "0.29.0")
    ],
    targets: [
        .executableTarget(
            name: "mdclip",
            dependencies: [
                .product(name: "libcmark_gfm", package: "libcmark_gfm")
            ]),
    ]
)
