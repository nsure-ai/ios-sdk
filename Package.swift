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
            checksum: "34588dc1930b992edf4f28cacbde6599d0b769c76eae28ed266e77821d345d46"
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
