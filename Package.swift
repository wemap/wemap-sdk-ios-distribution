// swift-tools-version:5.9
import PackageDescription

let version = "0.28.2"
let baseURL = "https://s3.eu-west-1.amazonaws.com/mobile.getwemap.com/releases/ios"

let package = Package(
    name: "WemapSDKs",
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "WemapCoreSDK", targets: ["WemapCoreSDKWrapper"]),
        .library(name: "WemapMapSDK",  targets: ["WemapMapSDKWrapper"]),
        .library(name: "WemapGeoARSDK", targets: ["WemapGeoARSDKWrapper"]),
        .library(name: "WemapPositioningSDKVPSARKit", targets: ["WemapPositioningSDKVPSARKitWrapper"]),
        .library(name: "WemapPositioningSDKGPS", targets: ["WemapPositioningSDKGPSWrapper"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/mapbox/turf-swift.git",
            exact: "4.0.0"
        ),
        .package(
            url: "https://github.com/maplibre/maplibre-gl-native-distribution.git",
            exact: "6.23.0"
        )
    ],
    targets: [
        .target(
            name: "WemapCoreSDKWrapper",
            dependencies: [
                "WemapCoreSDKBinary",
                .product(name: "Turf", package: "turf-swift")
            ]
        ),
        .binaryTarget(
            name: "WemapCoreSDKBinary",
            url: "\(baseURL)/core/\(version)/WemapCoreSDK.zip",
            checksum: "b1100b279773ce70e5d760735a31c72e330a07670ffca6ed42e6672ef7f498f5"
        ),
        .target(
            name: "WemapMapSDKWrapper",
            dependencies: [
                "WemapCoreSDKWrapper",
                "WemapMapSDKBinary",
                .product(name: "MapLibre", package: "maplibre-gl-native-distribution"),
            ]
        ),
        .binaryTarget(
            name: "WemapMapSDKBinary",
            url: "\(baseURL)/map/\(version)/WemapMapSDK.zip",
            checksum: "404f2068c25d6386f5ef4711aad239e71651098c4db3cfda5d9e89ea0b8f3781"
        ),
        .target(
            name: "WemapGeoARSDKWrapper",
            dependencies: [
                "WemapCoreSDKWrapper",
                "WemapGeoARSDKBinary"
            ]
        ),
        .binaryTarget(
            name: "WemapGeoARSDKBinary",
            url: "\(baseURL)/geoar/\(version)/WemapGeoARSDK.zip",
            checksum: "d529b144f68fd90f43d2f0805609adca5c1b434a31f770aff833e5f8ccdb39f2"
        ),
        .target(
            name: "WemapPositioningSDKVPSARKitWrapper",
            dependencies: [
                "WemapCoreSDKWrapper",
                "WemapPositioningSDKVPSARKitBinary"
            ]
        ),
        .binaryTarget(
            name: "WemapPositioningSDKVPSARKitBinary",
            url: "\(baseURL)/positioning/vpsarkit/\(version)/WemapPositioningSDKVPSARKit.zip",
            checksum: "28bdab20aa3d4df4000b1ba38766c842468ad85ef14ab14e7895b976afd7c2b6"
        ),
         .target(
            name: "WemapPositioningSDKGPSWrapper",
            dependencies: [
                "WemapCoreSDKWrapper",
                "WemapPositioningSDKGPSBinary"
            ]
        ),
        .binaryTarget(
            name: "WemapPositioningSDKGPSBinary",
            url: "\(baseURL)/positioning/gps/\(version)/WemapPositioningSDKGPS.zip",
            checksum: "1ac20e47516088f4560d8889b35a8f8085626e832f6c5dcfdc4d5a379692c4d4"
        )
    ]
)
