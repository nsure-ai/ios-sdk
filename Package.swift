// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "nSure",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "nSure", targets: ["nSure", "nSureDependencies"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/fingerprintjs/fingerprint-ios",
            from: "4.0.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "nSure",
            url: "https://github.com/nsure-ai/ios-sdk/releases/download/1.4.3/nSure.xcframework.zip",
            checksum: "edbcd070db1c42b9d97c7a25a16aea0f719093fafd00bcee37de81d5535f98b2"
        ),
        .target(
            name: "nSureDependencies",
            dependencies: [
                "nSure",
                .product(name: "Fingerprint", package: "fingerprint-ios")
            ],
            path: "Sources/nSureDependencies"
        )
    ]
)
