// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PokemonCryKit",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "PokemonCryKit",
            targets: ["PokemonCryKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PokemonCryKit",
            dependencies: [],
            resources: [.process("Resources")]
        )
    ]
)
