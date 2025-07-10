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
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .upToNextMajor(from: "11.0.0")),
        .package(url: "https://github.com/getstoryteller/storyteller-sdk-swift-package", exact: "10.12.2")
    ],
    targets: [
        .binaryTarget(name: "StorytellerGAMIntegration",
                      url: "https://storyteller.azureedge.net/sdk-ios/xcframeworks/10.12.2/StorytellerGAMIntegration.zip",
                      checksum: "0e95397b2a48ede785930c469ca555d6185b5c98aa9ed10b9ef00881408a625e"),
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
