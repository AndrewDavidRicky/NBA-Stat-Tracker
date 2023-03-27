//
//  GameTableViewController.swift
//  NBA Stat Tracker
//
//  Created by Ricky Wong on 3/22/23.
//

import UIKit

class GameTableViewController: UITableViewController {
    
    // Hardcoded list of fake NBA games with scores
        let nbaGames = [
            ("Atlanta Hawks", 102, "Boston Celtics", 98),
            ("Brooklyn Nets", 111, "Charlotte Hornets", 104),
            ("Chicago Bulls", 120, "Cleveland Cavaliers", 115),
            ("Dallas Mavericks", 112, "Denver Nuggets", 106),
            ("Detroit Pistons", 95, "Golden State Warriors", 108),
            // Add more fake games if you like
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // We only have one section in this table
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of games in the list
        return nbaGames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell from the table view with an identifier defined in the Storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)

        // Configure the cell with the game information
        let game = nbaGames[indexPath.row]
        cell.textLabel?.text = "\(game.0) \(game.1) - \(game.3) \(game.2)"

        return cell
    }

}
