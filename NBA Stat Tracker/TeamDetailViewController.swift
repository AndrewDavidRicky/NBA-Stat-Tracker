import UIKit

class TeamDetailViewController: UIViewController {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var playerTableView: UITableView!
    
    @IBOutlet weak var PlayerNameCell: UIView!
    var teamID: Int?
    var name: String?
    var wikipediaLogoUrl: String?
    var teamKey: String?
    var players: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the team name label
        teamNameLabel.text = name
        
        // Load the team logo image from the URL
        if let wikipediaLogoUrl = wikipediaLogoUrl,
           let imageUrl = URL(string: wikipediaLogoUrl),
           let imageData = try? Data(contentsOf: imageUrl),
           let image = UIImage(data: imageData) {
            teamLogoImageView.image = image
        }
        
        // Set up the player table view
//        playerTableView.dataSource = self
        
        // Fetch the players for the team
        fetchPlayers()
    }
    
    func fetchPlayers() {
        guard let teamKey = teamKey else {
            return
        }
        
        let url = URL(string: "https://api.sportsdata.io/v3/nba/scores/json/Players/\(teamKey)?key=85df2d15c78d4449913f9a6e96000608")!
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, let self = self else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let players = try decoder.decode([Player].self, from: data)
                DispatchQueue.main.async {
                    self.players = players
//                    self.playerTableView.reloadData()
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
    
}
//
//extension TeamDetailViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return players.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerNameCell", for: indexPath)
//        let player = players[indexPath.row]
//        cell.textLabel?.text = player.firstName
//        return cell
//    }
//}
