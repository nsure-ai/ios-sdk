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
            url: "https://github.com/nsure-ai/ios-sdk/releases/download/1.4.1/nSure.xcframework.zip",
            checksum: "6d2ecbd88778f5e24ed1f1d72fb6696539b3a9e7eb84514c74aefa7549475ab7"
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
