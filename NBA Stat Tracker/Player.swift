struct Player: Codable {
    let playerID: Int
    let sportsDataID: String?
    let status: String
    let teamID: Int
    let team: String
    let jersey: Int
    let positionCategory: String
    let position: String
    let firstName: String
    let lastName: String
    let height: Int
    let weight: Int
    let birthDate: String
    let birthCity: String
    let birthState: String?
    let birthCountry: String
    let highSchool: String?
    let college: String
    let salary: Int?
    let photoUrl: String
    let experience: Int?
    let sportRadarPlayerID: String?
    let rotoworldPlayerID: Int?
    let rotoWirePlayerID: Int?
    let fantasyAlarmPlayerID: Int?
    let statsPlayerID: Int?
    let sportsDirectPlayerID: Int?
    let xmlTeamPlayerID: Int?
    let injuryStatus: String
    let injuryBodyPart: String
    let injuryStartDate: String?
    let injuryNotes: String
    let fanDuelPlayerID: Int?
    let draftKingsPlayerID: Int?
    let yahooPlayerID: Int?
    let fanDuelName: String
    let draftKingsName: String
    let yahooName: String
    let depthChartPosition: String?
    let depthChartOrder: Int?
    let globalTeamID: Int
    let fantasyDraftName: String?
    let fantasyDraftPlayerID: Int?
    let usaTodayPlayerID: Int?
    let usaTodayHeadshotUrl: String?
    let usaTodayHeadshotNoBackgroundUrl: String?
    let usaTodayHeadshotUpdated: String?
    let usaTodayHeadshotNoBackgroundUpdated: String?
    let nbaDotComPlayerID: Int?
    let gameInfo: String?
    let averageFantasyPointsPerGame: Double?
    let recentFantasyPoints: Double?
    let number: Int?
    let playerName: String?
    let teamAbbreviation: String?
    let opposingTeamAbbreviation: String?
    let projectedFantasyPoints: Double?
    enum CodingKeys: String, CodingKey {
        case playerID = "PlayerID"
        case sportsDataID = "SportsDataID"
        case status = "Status"
        case teamID = "TeamID"
        case team = "Team"
        case jersey = "Jersey"
        case positionCategory = "PositionCategory"
        case position = "Position"
        case firstName = "FirstName"
        case lastName = "LastName"
        case height = "Height"
        case weight = "Weight"
        case birthDate = "BirthDate"
        case birthCity = "BirthCity"
        case birthState = "BirthState"
        case birthCountry = "BirthCountry"
        case highSchool = "HighSchool"
        case college = "College"
        case salary = "Salary"
        case photoUrl = "PhotoUrl"
        case experience = "Experience"
        case sportRadarPlayerID = "SportRadarPlayerID"
        case rotoworldPlayerID = "RotoworldPlayerID"
        case rotoWirePlayerID = "RotoWirePlayerID"
        case fantasyAlarmPlayerID = "FantasyAlarmPlayerID"
        case statsPlayerID = "StatsPlayerID"
        case sportsDirectPlayerID = "SportsDirectPlayerID"
        case xmlTeamPlayerID = "XmlTeamPlayerID"
        case injuryStatus = "InjuryStatus"
        case injuryBodyPart = "InjuryBodyPart"
        case injuryStartDate = "InjuryStartDate"
        case injuryNotes = "InjuryNotes"
        case fanDuelPlayerID = "FanDuelPlayerID"
        case draftKingsPlayerID = "DraftKingsPlayerID"
        case yahooPlayerID = "YahooPlayerID"
        case fanDuelName = "FanDuelName"
        case draftKingsName = "DraftKingsName"
        case yahooName = "YahooName"
        case depthChartPosition = "DepthChartPosition"
        case depthChartOrder = "DepthChartOrder"
        case globalTeamID = "GlobalTeamID"
        case fantasyDraftName = "FantasyDraftName"
        case fantasyDraftPlayerID = "FantasyDraftPlayerID"
        case usaTodayPlayerID = "USA_TodayPlayerID"
        case usaTodayHeadshotUrl = "USA_TodayHeadshotUrl"
        case usaTodayHeadshotNoBackgroundUrl = "USA_TodayHeadshotNoBackgroundUrl"
        case usaTodayHeadshotUpdated = "USA_TodayHeadshotUpdated"
        case usaTodayHeadshotNoBackgroundUpdated = "USA_TodayHeadshotNoBackgroundUpdated"
        case nbaDotComPlayerID = "NBA_dot_comPlayerID"
        case gameInfo = "GameInfo"
        case averageFantasyPointsPerGame = "AverageFantasyPointsPerGame"
        case recentFantasyPoints = "RecentFantasyPoints"
        case number = "Number"
        case playerName = "PlayerName"
        case teamAbbreviation = "TeamAbbreviation"
        case opposingTeamAbbreviation = "OpponentTeamAbbreviation"
        case projectedFantasyPoints = "ProjectedFantasyPoints"
    }

}
