// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "OAuthSwiftAuthenticationServices",
    products: [
        .library(
            name: "OAuthSwiftAuthenticationServices",
            targets: ["OAuthSwiftAuthenticationServices"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/OAuthSwift/OAuthSwift", .branch("master")),
    ],
    targets: [
        .target(
            name: "OAuthSwiftAuthenticationServices",
            dependencies: ["OAuthSwift"]
        ),
    ]
)
