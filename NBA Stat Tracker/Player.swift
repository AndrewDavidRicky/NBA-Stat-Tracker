import Foundation

struct PlayerResponse: Decodable {
    let results: [[Player]]
    
}

struct Player: Decodable {
    let PlayerId: Int?
    let Team: String?
    let Jersey: Int?
    let FirstName: String?
    let LastName: String?
    
    
}
