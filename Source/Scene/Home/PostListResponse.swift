import Foundation

struct PostListResponse: Decodable {
    let id: Int
    let title: String
    let nickname: String
    let time: String
    let price: Int
    let image: String?
}

extension PostListResponse {
    func toDomain() -> MentorTimeEntity {
        MentorTimeEntity(id: id, title: title, auhtor: nickname, imageURL: image, date: time, price: price)
    }
}
