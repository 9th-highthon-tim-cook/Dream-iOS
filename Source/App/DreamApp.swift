import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct DreamApp: App {
    @StateObject var sceneState = SceneState()
    init() {
        KakaoSDK.initSDK(appKey: "98deb67077dbe0a14efdc9771aec9c95")
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(sceneState)
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
