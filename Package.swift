// swift-tools-version:5.9
import PackageDescription

let version = "0.28.0-dev"
let baseURL = "https://github.com/wemap/wemap-sdk-ios-distribution/releases/download/\(version)"

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
        ),
        // .package(
        //     url: "https://github.com/marmelroy/Zip.git",
        //     exact: "2.1.2"
        // )
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
            url: "\(baseURL)/WemapCoreSDK.zip",
            checksum: "7ee795fcd5ec135109f157169b188ea05e3f4c2ce2721c0d77f89baf1a975bd1"
        ),
        .target(
            name: "WemapMapSDKWrapper",
            dependencies: [
                "WemapCoreSDKWrapper",
                "WemapMapSDKBinary",
                .product(name: "MapLibre", package: "maplibre-gl-native-distribution"),
                // .product(name: "Zip", package: "Zip")
            ]
        ),
        .binaryTarget(
            name: "WemapMapSDKBinary",
            url: "\(baseURL)/WemapMapSDK.zip",
            checksum: "3dc79dd9b844979229a5b691fa7232e5dd32d2abac6554d8d1423a9de52baab9"
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
            url: "\(baseURL)/WemapGeoARSDK.zip",
            checksum: "4d68567f327f55f92eb223bcfaa22f4ca5b1a31ec1c851a3f3a70fbe4d2318e5"
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
            url: "\(baseURL)/WemapPositioningSDKVPSARKit.zip",
            checksum: "79cb72dab2c60ebf688963cf397acbc1f5f261433f4a4791ae708652302e3f24"
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
            url: "\(baseURL)/WemapPositioningSDKGPS.zip",
            checksum: "28eb8623221694d724f7faf0c03021c461699a910493b54e6feeafc8b67b5845"
        )
    ]
)
