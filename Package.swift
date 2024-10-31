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
        .package(url: "https://github.com/getstoryteller/storyteller-sdk-swift-package", exact: "10.6.3")
    ],
    targets: [
        .binaryTarget(name: "StorytellerGAMIntegration",
                      url: "https://storyteller.azureedge.net/sdk-ios/xcframeworks/10.6.3/StorytellerGAMIntegration.zip",
                      checksum: "95e4c5bb583bc261eef1de2ebb7b1c38f0cb1231129084fed2410f9e5c47f67c"),
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
