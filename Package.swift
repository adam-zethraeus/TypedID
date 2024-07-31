// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "TypedID",
  platforms: [.iOS(.v15), .macOS(.v12)],
  products: [
    .library(
      name: "TypedID",
      targets: ["TypedID"]
    )
  ],
  targets: [
    .target(
      name: "TypedID"),
    .testTarget(
      name: "TypedIDTests",
      dependencies: ["TypedID"]
    ),
  ]
)
