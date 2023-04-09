
//
//  PlayerTableViewController.swift
//  NBA Stat Tracker
//
//  Created by David Helsel on 3/26/23.
//

import UIKit

class PlayerTableViewController: UITableViewController {
    
    var nbaPlayers = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.sportsdata.io/v3/nba/scores/json/Players?key=85df2d15c78d4449913f9a6e96000608")!
        let request = URLRequest(url: url)
        
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            
            
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            
            do {
               
                
                // Create a JSON Decoder
                let decoder = JSONDecoder()
                //let dateFormatter = DateFormatter()
                //dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                //decoder.dateDecodingStrategy = .formatted(dateFormatter)

                // Use the JSON decoder to try and map the data to our custom model.
                // TrackResponse.self is a reference to the type itself, tells the decoder what to map to.
                let response = try decoder.decode([Player].self, from: data)

                // Access the array of tracks from the `results` property
                //let players = response.results.flatMap { $0 }.filter { player in
                                //return player.FirstName != nil && player.Team != nil
                           // }
                // Execute UI updates on the main thread when calling from a background callback
                DispatchQueue.main.async {

                    // Set the view controller's tracks property as this is the one the table view references
                    self?.nbaPlayers = response

                    // Make the table view reload now that we have new data
                    self?.tableView.reloadData()
                }

                //print("✅ \(nbaPlayers)")


            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }

            
            
        }
        
        task.resume()
 
        
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
        cell.textLabel?.text = player.FirstName

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
                destinationVC.playerName = player.FirstName
                //destinationVC.pointsPerGame = player.1
                //destinationVC.reboundsPerGame = player.2
                //destinationVC.assistsPerGame = player.3
                //destinationVC.height = player.4
                destinationVC.teamName = player.Team
            }
        }
    }


}
