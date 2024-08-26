// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "StorytellerGAMIntegration",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "StorytellerGAMIntegration",
            targets: ["StorytellerGAMIntegration"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .upToNextMajor(from: "11.0.0")),
        .package(url: "https://github.com/getstoryteller/storyteller-sdk-swift-package", exact: "10.4.0")
    ],
    targets: [
        .binaryTarget(name: "StorytellerGAMIntegration",
                      url: "https://storyteller.azureedge.net/sdk-ios/xcframeworks/10.4.0/StorytellerGAMIntegration.zip",
                      checksum: "21d3bb3b50d8a7c01501f782dad63f3feaaf20bf65f904acd197ecc1c31c04f9")
    ]
)
