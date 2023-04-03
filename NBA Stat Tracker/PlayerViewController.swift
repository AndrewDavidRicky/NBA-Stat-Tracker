import UIKit
import JumpShot

class PlayerViewController: UIViewController {
    
    // Outlets for the player details labels
    
    @IBOutlet weak var assistsPerGameLabel: UILabel!
    @IBOutlet weak var reboundsPerGameLabel: UILabel!
    @IBOutlet weak var pointsPerGameLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    // Properties to hold the player's data
    var playerName: String?
    var pointsPerGame: Double?
    var reboundsPerGame: Double?
    var assistsPerGame: Double?
    //var height: String?
    var teamName: String?
    var playerId: String?
    let jumpShot = JumpShot()
    let jumpShotFunctions = ["getTeams()",
                                 "getTeamImage()",
                                 "getPlayerImage() - Small",
                                 "getPlayerImage() - Large",
                                 "getPlayers()",
                                 "getDailySchedule(for: \"04/20/2021\")",
                                 "getStandings()",
                                 "getTeamLeaders(for: \"1610612737\")",
                                 "getTeamSchedules(for: \"1610612737\")",
                                 "getCompleteSchedule()",
                                 "getCoaches()",
                                 "getTeamStatRankings()",
                                 "playerStatsSummary(for: \"2544\")",
                                 "getGamePlays(for: \"20210125\", and \"0022000257\")",
                                 "getLeadTrackers(for: \"20170201\", and \"0022000257\", and \"1\")",
                                 "getGameRecap(for: \"20210125\", and \"0022000257\")",
                                 "getTotalLeagueLeaders(for: \"2020\", and .regularSeason, and .playerEfficiency)",
                                 "getPerGameLeagueLeaders(for: \"2020\", and .regularSeason, and .playerEfficiency)",
                                 "getPer48LeagueLeaders(for: \"2020\", and .regularSeason, and .playerEfficiency)",
                                 "getBoxscore(for: \"20210125\", and \"0022000257\")"]


    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("player id!!!!!!!!!!!")
        print("####################")
        print(playerId)
        print("###################")
        getPlayerStatsSummary()
        
        // Set the player details labels
        playerNameLabel.text = playerName
        //pointsPerGameLabel.text = "Points Per Game: " + (pointsPerGame != nil ? String(pointsPerGame!) : "")
        reboundsPerGameLabel.text = "Rebounds Per Game: " + (reboundsPerGame != nil ? String(reboundsPerGame!) : "")
        assistsPerGameLabel.text = "Assists Per Game: " + (assistsPerGame != nil ? String(assistsPerGame!) : "")

        //heightLabel.text = height
        teamNameLabel.text = teamName
    }
    
    
    public func getPlayerStatsSummary() {
        jumpShot.getGetPlayerStatsSummary(for: "203085") { playerStatsSummary, error in
               guard error == nil else {
                   print("error here")
                   print(error!)
                   return
               }

               guard let playerStatsSummary = playerStatsSummary else {
                   print("No rankings returned.")
                   return
               }

              print("SUCCESSFUL!")
               print(playerStatsSummary)
           }
       }
    
}
