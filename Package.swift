// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BKAttributedStringBuilder",
    platforms: [
        .iOS(.v8),
        .macOS(.v10_11),
        .watchOS(.v2),
        .tvOS(.v9)
    ],
    products: [
        .library(name: "BKAttributedStringBuilder", targets: ["BKAttributedStringBuilder"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(name: "BKAttributedStringBuilder", dependencies: []),
    ]
)
