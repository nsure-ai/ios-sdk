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
            url: "https://github.com/nsure-ai/ios-sdk/releases/download/1.3.17/nSure.xcframework.zip",
            checksum: "488d9ff71b9a1be6d1bc9e304fe0688adb6d44f1e2cc2ebaefac546ba81a9caf"
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
