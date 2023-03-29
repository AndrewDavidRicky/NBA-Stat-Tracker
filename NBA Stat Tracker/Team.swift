struct TeamResponse: Codable {
    let data: [Team]
    let included: [Included]
}

struct Team: Codable {
    let id: String
    let type: String
    let attributes: TeamAttributes
    let relationships: TeamRelationships
}

struct TeamAttributes: Codable {
    let name: String
    let locale: String
    let abbreviation: String?
    let color: String
    let secondaryColor: String?
    let tertiaryColor: String?
    let quaternaryColor: String?
    let conferenceName: String?
    let divisionName: String?
    let slug: String
}

struct TeamRelationships: Codable {
    let conference: Conference
    let division: Division
    let primaryLogo: Logo
    let secondaryLogo: Logo

    enum CodingKeys: String, CodingKey {
        case conference
        case division
        case primaryLogo = "primary_logo"
        case secondaryLogo = "secondary_logo"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        conference = try container.decode(Conference.self, forKey: .conference)
        division = try container.decode(Division.self, forKey: .division)
        primaryLogo = try container.decode(Logo.self, forKey: .primaryLogo)
        secondaryLogo = try container.decode(Logo.self, forKey: .secondaryLogo)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(conference, forKey: .conference)
        try container.encode(division, forKey: .division)
        try container.encode(primaryLogo, forKey: .primaryLogo)
        try container.encode(secondaryLogo, forKey: .secondaryLogo)
    }
}


struct Conference: Codable {
    let id: String
    let type: String
    let attributes: ConferenceAttributes
}

struct ConferenceAttributes: Codable {
    let name: String
}

struct Division: Codable {
    let id: String
    let type: String
    let attributes: DivisionAttributes
}

struct DivisionAttributes: Codable {
    let name: String
}

struct Logo: Codable {
    let id: String
    let type: String
    let attributes: LogoAttributes
}

struct LogoAttributes: Codable {
    let alt: String?
    let height: Int
    let width: Int
    let url: String
}

struct Included: Codable {
    let id: String
    let type: String
    let attributes: IncludedAttributes
}

struct IncludedAttributes: Codable {
    let name: String?
    let abbreviation: String?
    let color: String?
    let primary: Bool?
    let alt: String?
    let height: Int?
    let width: Int?
    let url: String?
    let location: String?
}
