import Foundation

struct KakaoUserInfoResponse: Decodable {
    let kakaoUserInfoResponse: InfoResponse
    let signedUp: Bool

    struct InfoResponse: Decodable {
        let id: String
    }
}
