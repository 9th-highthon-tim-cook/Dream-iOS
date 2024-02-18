import Foundation

struct MentorSignupRequest: Encodable {
    let nickname: String
    let userId: String
    let userType: String = "MENTEE"
    let salary: Int?
    let career: String
    let company: String?
    let careerYear: Int?
    let description: String
}
