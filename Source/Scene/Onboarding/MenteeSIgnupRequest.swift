import Foundation

struct MenteeSIgnupRequest: Encodable {
    let nickname: String
    let userId: String
    let userType: String = "MENTEE"
}
