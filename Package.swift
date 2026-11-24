// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "nSure",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "nSure", targets: ["nSure", "nSureDependencies"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/fingerprintjs/fingerprint-ios",
            from: "4.3.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "nSure",
            url: "https://github.com/nsure-ai/ios-sdk/releases/download/1.5.0/nSure.xcframework.zip",
            checksum: "6433657f8d1fd7661de4bc5c3adc58094d12bb9a5146f19d2280dfd0e33d4189"
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
