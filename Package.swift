// swift-tools-version:5.9
import PackageDescription

// TaxTrack copy of Tracelet 3.8.8: the engine downloads from Tracelet's
// official GitHub release instead of a local folder.
let package = Package(
    name: "TraceletSDK",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "TraceletSDK", targets: ["TraceletSDK"]),
    ],
    targets: [
        .target(
            name: "TraceletSDK",
            dependencies: ["TraceletCore"],
            path: "sdk/ios/Sources/TraceletSDK",
            exclude: ["tracelet_coreFFI.modulemap", "tracelet_coreFFI.h"],
            linkerSettings: [.linkedLibrary("sqlite3")]
        ),
        .binaryTarget(
            name: "TraceletCore",
            url: "https://github.com/Ikolvi/Tracelet/releases/download/tracelet_ios-v3.8.8/TraceletCore.xcframework.zip",
            checksum: "0c7b8cd6a2a817be3aece2b8913e895d5efa8d045a174dbc9b5deb9f66154703"
        ),
    ]
)
