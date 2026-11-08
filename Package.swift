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
            checksum: "5ef2edb03c0aa82399d80da327f1e564a9c65c76e2dc2aec31281d80bc0cf6e2"
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
