import ProjectDescription

let projectName = "Dream"
let organizationName = "com.highthon"

let project = Project(
    name: projectName,
    organizationName: organizationName,
    targets: [
        Target(
            name: "\(projectName)",
            platform: .iOS,
            product: .app,
            bundleId: "\(organizationName).\(projectName)",
            deploymentTarget: .iOS(targetVersion: "17.0", devices: .iphone),
            infoPlist: .file(path: Path("Support/Info.plist")),
            sources: ["Source/**"],
            resources: ["Resource/**"],
            dependencies: [
                .external(name: "Moya"),
                .external(name: "TossPayments")
            ]
        )
    ]
)
