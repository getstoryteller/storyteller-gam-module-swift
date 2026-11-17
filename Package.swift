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
        .package(url: "https://github.com/getstoryteller/storyteller-sdk-swift-package", exact: "11.9.2")
    ],
    targets: [
        .binaryTarget(name: "StorytellerGAMIntegration",
                      url: "https://feeds.usestoryteller.com/sdk-ios/xcframeworks/11.9.2/StorytellerGAMIntegration.zip",
                      checksum: "8ab706c33d63ba3c60ac9d60ef00a435bd327ba2d0e1a1678d72f10482cbe533"),
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
