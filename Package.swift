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
            url: "https://github.com/nsure-ai/ios-sdk/releases/download/1.5.0/nSure.xcframework.zip",
            checksum: "26c3ec3b07dbd90483288ea11bdd1c2259d6462de22d51b2d837523cc7e61427"
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
