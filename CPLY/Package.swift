// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CPLY",
    platforms: [
        .iOS(.v14),
        .macOS(.v13),
        .tvOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CPLY",
            targets: ["CPLY"]
        ),
    ],
    targets: [
        .target(
            name: "CPLY",
            path: "CPLY",
            sources: [
                "wrapper.cpp",
                "miniply.cpp"
            ],
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("include/CPly"),
                .headerSearchPath("include/miniply"),
                .headerSearchPath("include/module"),
                .unsafeFlags(["-stdlib=libc++"])
            ],
            linkerSettings: [
                .linkedLibrary("c++")
            ]
        ),
    ]
)
