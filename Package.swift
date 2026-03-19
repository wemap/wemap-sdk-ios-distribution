// swift-tools-version:5.9
import PackageDescription

let version = "0.28.0-dev.2"
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
            checksum: "75cabb0f0240f4077281c4bac1456a83184ab23be472621373a0f55dacfef307"
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
            checksum: "a1b2c415ead76302dd8387bfc4066ced7c1483bc04af9329d56727f0f33b0743"
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
            checksum: "5e3101ed1251254f1a49ee18a5f73e8697842ce54d12396359df6ba72421636d"
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
            checksum: "f97509367dd19cea935d5f6b6b81ad7c38aed31e33851af3ae05e6f88c20e472"
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
            checksum: "aa90727e8f650342162d21d7f6091fe51ef8ebcda67b27768909a0ca677e3a3c"
        )
    ]
)
