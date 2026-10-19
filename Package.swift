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
            url: "https://github.com/nsure-ai/ios-sdk/releases/download/1.4.2/nSure.xcframework.zip",
            checksum: "e0730475ba987cda23b032a0e073d1790da21ac78d2a2d1092a9baf11f85d032"
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
