// swift-tools-version:5.9
import PackageDescription

let version = "0.28.0"
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
            checksum: "d0f26c7b5a97344f498c168902641703c2d660827ac3d4a15bb15ad2cda7f5a5"
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
            checksum: "873bd0f014217b393dc1fdf33ae4d515d50484c5f0c24aa47d2bb7d3757482b3"
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
            checksum: "eed8111cec762c0f12b569f2006c05f6e9135e20dcc7235d5e48173e05472a1d"
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
            checksum: "cc3095bb55a2f7e215a9768ce72ce3fb5664f1787c6f2fb782020595ddfb0424"
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
            checksum: "c276a98080a9ba78ebec8d3a794419943d95f975d3143185a92191725f0a110c"
        )
    ]
)
