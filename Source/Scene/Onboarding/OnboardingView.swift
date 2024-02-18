import SwiftUI
import KakaoSDKUser

struct OnboardingView: View {
    @State var signupRequired: Bool = false
    @EnvironmentObject var sceneState: SceneState

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
                                Task {
                                    var component = URLComponents(string: "http://192.168.10.147:3034/auth/kakao/info")
                                    component?.queryItems = [
                                        .init(name: "token", value: oauthToken?.accessToken)
                                    ]
                                    let request = URLRequest(url: (component?.url!)!)
                                    
                                    let (data, res) = try await URLSession.shared.data(for: request)
                                    print(res)
                                    print(String(data: data, encoding: .utf8))
                                    let response = try JSONDecoder().decode(KakaoUserInfoResponse.self, from: data)
                                    UserDefaults.standard.setValue(response.kakaoUserInfoResponse.id, forKey: "userID")
                                    
                                    guard response.signedUp else {
                                        signupRequired = true
                                        return
                                    }

                                    let loginReq = LoginRequest(userId: response.kakaoUserInfoResponse.id)
                                    var loginRequest = try URLRequest(url: "http://192.168.10.147:3034/auth/login", method: .post)
                                    loginRequest.httpBody = try JSONEncoder().encode(loginReq)
                                    
                                    let (loginData, loginRes) = try await URLSession.shared.data(for: loginRequest)
                                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: loginData)
                                    UserDefaults.standard.setValue(loginResponse.accessToken, forKey: "accessToken")
                                    sceneState.scene = .home
                                }
                            }
                        }
                    } else {
                        signupRequired = true
                    }
                }
            }
            .padding(16)
            .navigationTitle("")
            .navigationDestination(isPresented: $signupRequired) {
                SelectionView()
            }
        }
    }
}
