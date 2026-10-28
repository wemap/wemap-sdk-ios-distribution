// swift-tools-version:5.9
import PackageDescription

let version = "0.29.3"
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
            checksum: "0ab14bf0190ba2cb5f267dd7e1c8ed382a7c77642c1a43047f51ece08eaac343"
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
            checksum: "254feaf7158beeb02ee2d268fa3eda0c3b5fceb0eae291d87daaf0b12c8f9c1e"
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
            checksum: "a2eafbedca56a9c8240c00c47f0f4dcbca79b3c0fa0aec6d8b756704e66c390e"
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
            checksum: "38c5bd2ac969546563cd0903c5be9de48711f07116f9d1f31c731ee1acff2956"
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
            checksum: "4b4ca21d19f11ae827c5503aab769f655bc4498489b87246b9601e6c242fcab8"
        )
    ]
)
