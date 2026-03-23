// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "nSure",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "nSure", targets: ["nSure", "nSureDependencies"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/fingerprintjs/fingerprintjs-pro-ios",
            from: "2.13.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "nSure",
            url: "https://github.com/nsure-ai/ios-sdk/releases/download/1.3.15/nSure.xcframework.zip",
            checksum: "128f49c16a0caf16ee62f25f3888f3e73e2cef39bbe073cf590ffcf91affd94f"
        ),
        .target(
            name: "nSureDependencies",
            dependencies: [
                "nSure",
                .product(name: "FingerprintPro", package: "fingerprintjs-pro-ios")
            ],
            path: "Sources/nSureDependencies"
        )
    ]
)
