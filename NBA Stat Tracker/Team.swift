struct Team: Codable {
    let teamID: Int
    let key: String
    let active: Bool
    let city: String
    let name: String
    let leagueID: Int
    let stadiumID: Int
    let conference: String
    let division: String
    let primaryColor: String
    let secondaryColor: String
    let tertiaryColor: String
    let quaternaryColor: String
    let wikipediaLogoUrl: String
    let wikipediaWordMarkUrl: String?
    let globalTeamID: Int
    let nbaDotComTeamID: Int
    
    enum CodingKeys: String, CodingKey {
        case teamID = "TeamID"
        case key = "Key"
        case active = "Active"
        case city = "City"
        case name = "Name"
        case leagueID = "LeagueID"
        case stadiumID = "StadiumID"
        case conference = "Conference"
        case division = "Division"
        case primaryColor = "PrimaryColor"
        case secondaryColor = "SecondaryColor"
        case tertiaryColor = "TertiaryColor"
        case quaternaryColor = "QuaternaryColor"
        case wikipediaLogoUrl = "WikipediaLogoUrl"
        case wikipediaWordMarkUrl = "WikipediaWordMarkUrl"
        case globalTeamID = "GlobalTeamID"
        case nbaDotComTeamID = "NbaDotComTeamID"
    }
}
