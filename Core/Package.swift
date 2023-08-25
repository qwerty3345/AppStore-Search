// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Core",
  platforms: [.iOS(.v16)],
  products: [
    .library(
      name: "Core",
      targets: ["Core"]),
  ],
  targets: [
    .target(
      name: "Core",
      dependencies: []),
  ]
)
