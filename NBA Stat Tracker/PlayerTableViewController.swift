import UIKit
import JumpShot

class PlayerTableViewController: UITableViewController {

    var nbaPlayers = [Player]().self
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

        tableView.dataSource = self
        
        getPlayers()

        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // We only have one section in this table
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of games in the list
        return nbaPlayers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
        let player = nbaPlayers[indexPath.row]
        cell.textLabel?.text = player.self.firstName + " " + player.self.lastName
        return cell
    }
    
    
    private func getPlayers() {
            jumpShot.getPlayers { players, error in
                guard error == nil else {
                    print(error!)
                    return
                }

                guard let players = players else {
                    print("No players returned.")
                    return
                }

                self.nbaPlayers = players
                print(players)
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "showPlayerDetails" {
           // Get the selected player
           if let indexPath = tableView.indexPathForSelectedRow {
               let playerData = nbaPlayers[indexPath.row]
               

               let destinationVC = segue.destination as! PlayerViewController
               
               // Pass the player data to the destination view controller
               destinationVC.playerName = playerData.firstName + " "  + playerData.lastName
               destinationVC.pointsPerGame = 4 
               destinationVC.reboundsPerGame = 4
               destinationVC.assistsPerGame = 4
               destinationVC.teamName = playerData.teamId
               destinationVC.playerId = playerData.playerId
           }
       }
   }
}
