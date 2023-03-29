//
//  TeamTableViewController.swift
//  NBA Stat Tracker
//
//  Created by Ricky Wong on 3/26/23.
//

import UIKit

class TeamTableViewController: UITableViewController {
    
    // Hardcoded list of NBA teams
        let nbaTeams = [
            "Atlanta Hawks",
            "Boston Celtics",
            "Brooklyn Nets",
            "Charlotte Hornets",
            "Chicago Bulls",
            "Cleveland Cavaliers",
            "Dallas Mavericks",
            "Denver Nuggets",
            "Detroit Pistons",
            "Golden State Warriors",
            "Houston Rockets",
            "Indiana Pacers",
            "Los Angeles Clippers",
            "Los Angeles Lakers",
            "Memphis Grizzlies",
            "Miami Heat",
            "Milwaukee Bucks",
            "Minnesota Timberwolves",
            "New Orleans Pelicans",
            "New York Knicks",
            "Oklahoma City Thunder",
            "Orlando Magic",
            "Philadelphia 76ers",
            "Phoenix Suns",
            "Portland Trail Blazers",
            "Sacramento Kings",
            "San Antonio Spurs",
            "Toronto Raptors",
            "Utah Jazz",
            "Washington Wizards"
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // We only have one section in this table
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of teams in the list
        return nbaTeams.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell from the table view with an identifier defined in the Storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath)

        // Configure the cell with the team name
        cell.textLabel?.text = nbaTeams[indexPath.row]

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTeamDetails" {
            // Get the selected team
            if let indexPath = tableView.indexPathForSelectedRow {
                let team = nbaTeams[indexPath.row]
                
                // Get the destination view controller
                let destinationVC = segue.destination as! TeamDetailViewController
                
                // Pass the player's data to the destination view controller
                destinationVC.teamName = team
            }
        }
    }
}
