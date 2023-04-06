//
//  GameTableViewController.swift
//  NBA Stat Tracker
//
//  Created by Ricky Wong on 3/22/23.
//

import UIKit

class GameTableViewController: UITableViewController {
    
    var nbaGames: [(visitorTeam: String, visitorTeamScore: Int?, homeTeam: String, homeTeamScore: Int?, gameDateTime: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNBAGames()
    }
    
    func fetchNBAGames() {
        let apiKey = "85df2d15c78d4449913f9a6e96000608"
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: currentDate)
        
        let urlString = "https://api.sportsdata.io/v3/nba/scores/json/GamesByDate/\(dateString)?key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                guard let dataArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
                    print("Error getting data array from JSON")
                    return
                }
                
                var fetchedNBAGames: [(visitorTeam: String, visitorTeamScore: Int?, homeTeam: String, homeTeamScore: Int?, gameDateTime: String)] = []
                
                for game in dataArray {
                    guard let visitorTeamName = game["AwayTeam"] as? String,
                          let homeTeamName = game["HomeTeam"] as? String,
                          let gameDateTime = game["DateTime"] as? String else {
                        continue // Skip this game if any data is missing
                    }
                    
                    let visitorTeamScore = game["AwayTeamScore"] as? Int
                    let homeTeamScore = game["HomeTeamScore"] as? Int
                    
                    let nbaGame = (visitorTeamName, visitorTeamScore, homeTeamName, homeTeamScore, gameDateTime)
                    fetchedNBAGames.append(nbaGame)
                }
                
                DispatchQueue.main.async {
                    self.nbaGames = fetchedNBAGames
                    self.tableView.reloadData()
                }
                
            } catch {
                print("Error converting data to JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nbaGames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)

            // Clear cell background color
            cell.backgroundColor = .clear

            // Create a custom rounded background view
            let roundedBackgroundView = UIView()
            roundedBackgroundView.backgroundColor = .white // Change this to the desired cell background color
            roundedBackgroundView.layer.cornerRadius = 10
            roundedBackgroundView.clipsToBounds = true
            cell.backgroundView = roundedBackgroundView
        
        cell.textLabel?.textAlignment = .center
        
        let game = nbaGames[indexPath.row]
        
        if let visitorTeamScore = game.visitorTeamScore, let homeTeamScore = game.homeTeamScore {
            cell.textLabel?.text = "\(game.visitorTeam) \(visitorTeamScore) - \(homeTeamScore) \(game.homeTeam)"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            if let gameDate = dateFormatter.date(from: game.gameDateTime) {
                dateFormatter.dateFormat = "h:mm a"
                let gameTimeString = dateFormatter.string(from: gameDate)
                cell.textLabel?.text = "\(game.visitorTeam) @ \(game.homeTeam) - Scheduled: \(gameTimeString)"
            } else {
                cell.textLabel?.text = "\(game.visitorTeam) @ \(game.homeTeam) - Scheduled: Unknown time"
            }
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70 // Adjust this value based on the desired cell height
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10 // Adjust this value based on the desired spacing between cells
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .clear
        return header
    }
}


