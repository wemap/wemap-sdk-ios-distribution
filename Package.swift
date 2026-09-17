// swift-tools-version:5.9
import PackageDescription

let version = "0.29.2"
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
            exact: "6.26.0"
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
            checksum: "fafa619c3658d10c562f6b0328612e1c38c588f3904b6c610e19a7f20e03de42"
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
            checksum: "c8415d41d3e627021361c802e89a472095c9d60f78d089e27b7bea8d19ea211c"
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
            checksum: "31b61c77a624082c5914c696ff2df8b9ac03922af7030ec1fc458f5fcb69fdfa"
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
            checksum: "46416f02b25a508a4f0fd7d1c9299b749ec8685ead077178151f24bbd4714db7"
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
            checksum: "8a2e6024fb545b0a5042cd1777892a6e7297deaa3d9d4f35964b9b4c74a999fb"
        )
    ]
)
