import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct DreamApp: App {
    init() {
        KakaoSDK.initSDK(appKey: "98deb67077dbe0a14efdc9771aec9c95")
    }
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
