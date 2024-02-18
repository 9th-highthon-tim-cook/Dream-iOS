import Foundation

struct MentorTimeResponse: Decodable {
    let id: Int
    let title: String
    let nickname: String
    let time: String
    let price: Int
    let image: String
}
