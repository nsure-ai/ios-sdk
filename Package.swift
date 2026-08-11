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
            url: "https://github.com/nsure-ai/ios-sdk/releases/download/1.4.0/nSure.xcframework.zip",
            checksum: "c9379ee19d4add6bc77d6eebbadd556a226752b6652462ad9415e54ac3cf0b2a"
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
