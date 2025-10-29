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
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .upToNextMajor(from: "12.6.0")),
        .package(url: "https://github.com/getstoryteller/storyteller-sdk-swift-package", exact: "11.0.2")
    ],
    targets: [
        .binaryTarget(name: "StorytellerGAMIntegration",
                      url: "https://storyteller.azureedge.net/sdk-ios/xcframeworks/11.0.2/StorytellerGAMIntegration.zip",
                      checksum: "b6d63fc0a42e584c05cba2caabf51b6ac4e0ba4ed3a6a86e05e5ec3724d38a5e"),
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
