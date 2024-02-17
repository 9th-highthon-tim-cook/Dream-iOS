import SwiftUI
import KakaoSDKUser

struct OnboardingView: View {
    @State var loginCompleted: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Spacer()
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 208)
                Text("인생을 바꿀 시간을 팝니다")
                Spacer()
                KakaoButton {
                    if UserApi.isKakaoTalkLoginAvailable() {
                        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                            if let error = error {
                                print(error)
                            }
                            else {
                                print("loginWithKakaoTalk() success.")
                                print(oauthToken)
                            }
                        }
                    } else {
                        loginCompleted = true
                    }
                }
            }
            .padding(16)
            .navigationTitle("")
            .navigationDestination(isPresented: $loginCompleted) {
                SelectionView()
            }
        }
    }
}
