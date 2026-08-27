// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-pair-equation",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Pair Equation",
            targets: ["Pair Equation"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-pair.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-equation.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Pair Equation",
            dependencies: [
                .product(name: "Pair", package: "swift-pair"),
                .product(name: "Equation", package: "swift-equation"),
            ]
        ),
        .testTarget(
            name: "Pair Equation Tests",
            dependencies: [
                "Pair Equation",
                .product(name: "Pair", package: "swift-pair"),
                .product(name: "Equation", package: "swift-equation"),
            ],
            path: "Tests/Pair Equation Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
