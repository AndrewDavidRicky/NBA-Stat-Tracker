import UIKit

class PlayerViewController: UIViewController {
    
    // Outlets for the player details labels
    
    @IBOutlet weak var assistsPerGameLabel: UILabel!
    @IBOutlet weak var Game1: UITableViewCell!
    @IBOutlet weak var reboundsPerGameLabel: UILabel!
    @IBOutlet weak var RecentGame1: UITableViewCell!
    @IBOutlet weak var pointsPerGameLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    // Properties to hold the player's data
    var playerName: String?
    var pointsPerGame: Double?
    var reboundsPerGame: Double?
    var assistsPerGame: Double?
    var height: String?
    var teamName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the player details labels
        playerNameLabel.text = playerName
        pointsPerGameLabel.text = "Points Per Game: " + (pointsPerGame != nil ? String(pointsPerGame!) : "")
        reboundsPerGameLabel.text = "Rebounds Per Game: " + (reboundsPerGame != nil ? String(reboundsPerGame!) : "")
        assistsPerGameLabel.text = "Assists Per Game: " + (assistsPerGame != nil ? String(assistsPerGame!) : "")

        //heightLabel.text = height
        teamNameLabel.text = teamName
    }
    
}
