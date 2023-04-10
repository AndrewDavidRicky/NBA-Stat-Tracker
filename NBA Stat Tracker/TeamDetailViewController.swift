import UIKit
import Nuke

class TeamDetailViewController: UIViewController {

    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamNameLabel1: UILabel!
    @IBOutlet weak var teamNameLabel2: UILabel!
    @IBOutlet weak var teamNameLabel3: UILabel!
    @IBOutlet weak var teamNameLabel4: UILabel!
    @IBOutlet weak var teamNameLabel5: UILabel!

    @IBOutlet weak var resultLabel1: UILabel!
    @IBOutlet weak var resultLabel2: UILabel!
    @IBOutlet weak var resultLabel3: UILabel!
    @IBOutlet weak var resultLabel4: UILabel!
    @IBOutlet weak var resultLabel5: UILabel!

    @IBOutlet weak var opponentLabel1: UILabel!
    @IBOutlet weak var opponentLabel2: UILabel!
    @IBOutlet weak var opponentLabel3: UILabel!
    @IBOutlet weak var opponentLabel4: UILabel!
    @IBOutlet weak var opponentLabel5: UILabel!
    
    @IBOutlet weak var playerNameLabel1: UILabel!
    @IBOutlet weak var playerNameLabel2: UILabel!
    @IBOutlet weak var playerNameLabel3: UILabel!
    @IBOutlet weak var playerNameLabel4: UILabel!
    @IBOutlet weak var playerNameLabel5: UILabel!
    @IBOutlet weak var playerNameLabel6: UILabel!
    @IBOutlet weak var playerNameLabel7: UILabel!
    @IBOutlet weak var playerNameLabel8: UILabel!

    @IBOutlet weak var teamLogoImageView: UIImageView!

    @IBOutlet weak var winsLabel: UILabel!
    var teamID: Int?
    var name: String?
    var wikipediaLogoUrl: String = ""
    var teamKey: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the team name label
        teamNameLabel.text = name
        
        let imageUrl = URL(string: "https://a.espncdn.com/combiner/i?img=/i/teamlogos/nba/500/" + teamKey + ".png")
        Nuke.loadImage(with: imageUrl!, into: teamLogoImageView)

        // Fetch team data from API
        if let teamID = teamID {
            fetchTeamData(teamID: teamID)
            updateLabels(teamID: teamID)
        }
        
        let teamKey = teamKey
        
        updatePlayers(teamKey: teamKey)
        
    }

    func fetchTeamData(teamID: Int) {
        let urlString = "https://api.sportsdata.io/v3/nba/scores/json/Standings/2022?key=85df2d15c78d4449913f9a6e96000608"

        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            return
        }
        print("Fetching team data for teamID: \(teamID)") // Added print statement
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error fetching team data: \(error.localizedDescription)")
                return
            }

            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let teamStandings = try jsonDecoder.decode([TeamStanding].self, from: data)
                    if let teamData = teamStandings.first(where: { $0.teamID == teamID }) {
                        DispatchQueue.main.async {
                            print("Wins: \(teamData.wins)")
                            self?.winsLabel.text = " \(teamData.wins) Wins - \(teamData.losses) Losses"
                        }
                    } else {
                        print("Team data not found for teamID: \(teamID)")
                    }
                } catch {
                    print("Error decoding team data: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }

    func updateLabels(teamID: Int) {
        let urlString = "https://api.sportsdata.io/v3/nba/scores/json/TeamGameStatsBySeason/2023/\(teamID)/5?key=85df2d15c78d4449913f9a6e96000608"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let gameStats = try decoder.decode([TeamGameStats].self, from: data)

                    DispatchQueue.main.async {
                        // Update team name labels
                        self.teamNameLabel1.text = gameStats.indices.contains(0) ? gameStats[0].team : ""
                        self.teamNameLabel2.text = gameStats.indices.contains(1) ? gameStats[1].team : ""
                        self.teamNameLabel3.text = gameStats.indices.contains(2) ? gameStats[2].team : ""
                        self.teamNameLabel4.text = gameStats.indices.contains(3) ? gameStats[3].team : ""
                        self.teamNameLabel5.text = gameStats.indices.contains(4) ? gameStats[4].team : ""

                        // Update result labels
                        self.resultLabel1.text = gameStats.indices.contains(0) ? (gameStats[0].wins == 1 ? "Win" : "Loss") : ""
                        self.resultLabel2.text = gameStats.indices.contains(1) ? (gameStats[1].wins == 1 ? "Win" : "Loss") : ""
                        self.resultLabel3.text = gameStats.indices.contains(2) ? (gameStats[2].wins == 1 ? "Win" : "Loss") : ""
                        self.resultLabel4.text = gameStats.indices.contains(3) ? (gameStats[3].wins == 1 ? "Win" : "Loss") : ""
                        self.resultLabel5.text = gameStats.indices.contains(4) ? (gameStats[4].wins == 1 ? "Win" : "Loss") : ""

                        // Update opponent labels
                        self.opponentLabel1.text = gameStats.indices.contains(0) ? "\(gameStats[0].opponent)" : ""
                        self.opponentLabel2.text = gameStats.indices.contains(1) ? "\(gameStats[1].opponent)" : ""
                        self.opponentLabel3.text = gameStats.indices.contains(2) ? "\(gameStats[2].opponent)" : ""
                        self.opponentLabel4.text = gameStats.indices.contains(3) ? "\(gameStats[3].opponent)" : ""
                        self.opponentLabel5.text = gameStats.indices.contains(4) ? "\(gameStats[4].opponent)" : ""
                    }

                } catch {
                    print("Error decoding API response: \(error.localizedDescription)")
                }
            }
        }.resume()
    }

    func updatePlayers(teamKey: String) {
        let urlString = "https://api.sportsdata.io/v3/nba/scores/json/Players/\(teamKey)?key=85df2d15c78d4449913f9a6e96000608"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let teamPlayers = try decoder.decode([TeamPlayers].self, from: data)

                    DispatchQueue.main.async {
                        // Update player name labels
                        self.playerNameLabel1.text = teamPlayers.indices.contains(0) ? teamPlayers[0].firstName + " " + teamPlayers[0].lastName : ""
                        self.playerNameLabel2.text = teamPlayers.indices.contains(1) ? teamPlayers[1].firstName + " " + teamPlayers[1].lastName : ""
                        self.playerNameLabel3.text = teamPlayers.indices.contains(2) ? teamPlayers[2].firstName + " " + teamPlayers[2].lastName : ""
                        self.playerNameLabel4.text = teamPlayers.indices.contains(3) ? teamPlayers[3].firstName + " " + teamPlayers[3].lastName : ""
                        self.playerNameLabel5.text = teamPlayers.indices.contains(4) ? teamPlayers[4].firstName + " " + teamPlayers[4].lastName : ""
                        self.playerNameLabel6.text = teamPlayers.indices.contains(5) ? teamPlayers[5].firstName + " " + teamPlayers[5].lastName : ""
                        self.playerNameLabel7.text = teamPlayers.indices.contains(6) ? teamPlayers[6].firstName + " " + teamPlayers[6].lastName : ""
                        self.playerNameLabel8.text = teamPlayers.indices.contains(7) ? teamPlayers[7].firstName + " " + teamPlayers[7].lastName : ""
                    }
                } catch {
                    print("Error decoding API response: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

struct TeamStanding: Codable {
    let teamID: Int
    let wins: Int
    let losses: Int

    enum CodingKeys: String, CodingKey {
        case teamID = "TeamID"
        case wins = "Wins"
        case losses = "Losses"
    }
}

struct TeamGameStats: Codable {
    let team: String
    let wins: Int
    let opponent: String

    enum CodingKeys: String, CodingKey {
        case team = "Team"
        case wins = "Wins"
        case opponent = "Opponent"
    }
}

struct TeamPlayers: Codable {
    let firstName: String
    let lastName: String

    enum CodingKeys: String, CodingKey {
        case firstName = "FirstName"
        case lastName = "LastName"
    }
}
