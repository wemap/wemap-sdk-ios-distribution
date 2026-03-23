# Wemap SDKs for iOS

This repository contains releases of the Wemap SDKs for iOS for distribution via Swift Package Manager.

## Overview

The Wemap SDKs provide comprehensive location tracking, routing, and navigation capabilities for mobile applications.

## Requirements

Different Wemap SDKs have different requirements, but these are the common requirements applied to all of them.

- iOS 13 or newer
- Xcode 26.0 or newer
- Swift 5.9 or newer

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/wemap/wemap-sdk-ios-distribution.git", exact: "0.28.0")
]
```

Or add it through Xcode:

1. In your Xcode project or workspace, click on `File > Add Packages Dependencies...`
2. Paste the following GitHub URL into the search bar in the top right corner: https://github.com/wemap/wemap-sdk-ios-distribution
3. Select the `Dependency Rule` you want to apply to the Wemap SDKs
    - We recommend selecting `Up to Next Minor Version` for the `Dependency Rule`, specifying the latest version (ex.: 0.28.0) as the minimum version. This allows you to select the most recently released stable patch version of the SDKs.
4. Click on `Add Package`.
5. In the new window, click on the dropdown `Add to Target` and select your project target.
6. Click `Add Package`.
7. Verify that you can `import WemapMapSDK` (or any other WemapSDK) in your app.

## Documentation

For comprehensive guides, API documentation, and examples, visit the [official Wemap SDKs for iOS documentation](https://developers.getwemap.com/docs/ios-native/getting-started).

## Examples

For additional examples and sample implementations of WemapSDKs, visit the [official GitHub repository](https://github.com/wemap/wemap-sdk-sample-apps-ios).

## Report a bug

Please use the [bug template](https://github.com/wemap/wemap-sdk-sample-apps-ios/blob/main/.github/ISSUE_TEMPLATE/bug_report.md) in the sample apps repository to report any issues.
