// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "storyteller-gam-integration",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "StorytellerGAMIntegration",
            targets: ["StorytellerGAMTarget"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", "12.6.0"..<"14.0.0"),
        .package(url: "https://github.com/getstoryteller/storyteller-sdk-swift-package", exact: "11.9.1")
    ],
    targets: [
        .binaryTarget(name: "StorytellerGAMIntegration",
                      url: "https://feeds.usestoryteller.com/sdk-ios/xcframeworks/11.9.1/StorytellerGAMIntegration.zip",
                      checksum: "070fa83d0f1a6f02ad9547ddd3c49068a5e51605cbc007fcda3f82f49df8a11c"),
        .target(
            name: "StorytellerGAMTarget",
            dependencies: [
                .target(name: "StorytellerGAMIntegration"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .product(name: "StorytellerSDK", package: "storyteller-sdk-swift-package"),
            ],
            path: "Sources"
        )
    ]
)
