import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies([
        .remote(url: "https://github.com/Moya/Moya.git", requirement: .upToNextMajor(from: "15.0.3")),
        .remote(url: "https://github.com/tosspayments/payment-sdk-ios.git", requirement: .upToNextMajor(from: "0.1.29"))
    ]),
    platforms: [.iOS]
)
