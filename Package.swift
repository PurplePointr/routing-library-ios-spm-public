// swift-tools-version: 5.10
import PackageDescription

let gcsBucket = "https://storage.googleapis.com/ai-purple-xcframework/routing-library-ios"

let package = Package(
    name: "Routing",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "Routing", targets: ["Routing"])
    ],
    targets: [
        .binaryTarget(
            name: "RoutingCore",
            url: "\(gcsBucket)/RoutingCore-0.4.0-174.xcframework.zip",
            checksum: "a19360f347d9a4922dc3faa2ccc985eeda83401cf8a34947d9d802a134f5f453"
        ),
        .target(
            name: "Routing",
            dependencies: [
                .target(name: "RoutingCore")
            ]
        ),
        .testTarget(
            name: "RoutingTests",
            dependencies: [
                .target(name: "Routing")
            ]
        )
    ]
)
