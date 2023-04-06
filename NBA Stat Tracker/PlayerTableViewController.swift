//
//  PlayerTableViewController.swift
//  NBA Stat Tracker
//
//  Created by David Helsel on 3/26/23.
//

import UIKit

class PlayerTableViewController: UITableViewController {
    
    let nbaPlayers = [
        ("Luka Doncic", 32.9, 8.6, 8.2, "6'7\"", "Dallas Mavericks"),
        ("Giannis Antetokounmpo", 31.1, 11.7, 5.6, "6'7\"", "Milwaukee Bucks"),
        ("Joel Embiid", 33.3, 10.2, 4.2, "7'0\"", "Philadelphia 76ers"),
        ("Stephen Curry", 29.6, 6.2, 6.3, "6'2\"", "Golden State Warriors"),
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        // Dequeue a reusable cell from the table view with an identifier defined in the Storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)

        // Configure the cell with the game information
        let player = nbaPlayers[indexPath.row]
        cell.textLabel?.text = "\(player.0)  (\(player.1) - \(player.2) - \(player.3))"

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlayerDetails" {
            // Get the selected player
            if let indexPath = tableView.indexPathForSelectedRow {
                let player = nbaPlayers[indexPath.row]
                
                // Get the destination view controller
                let destinationVC = segue.destination as! PlayerViewController
                
                // Pass the player's data to the destination view controller
                destinationVC.playerName = player.0
                destinationVC.pointsPerGame = player.1
                destinationVC.reboundsPerGame = player.2
                destinationVC.assistsPerGame = player.3
                destinationVC.height = player.4
                destinationVC.teamName = player.5
            }
        }
    }


}

