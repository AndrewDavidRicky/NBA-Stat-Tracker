import UIKit
import Foundation

class TeamTableViewController: UITableViewController {
    
    // Array to store the teams
    var teams: [Team] = [Team]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call the API to get the list of teams
        let apiKey = "85df2d15c78d4449913f9a6e96000608"
        let urlString = "https://api.sportsdata.io/v3/nba/scores/json/teams?key=\(apiKey)"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            print(String(data: data, encoding: .utf8)!)

            // Parse the JSON response and extract the teams
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase // Use snake case decoding for keys
                self.teams = try decoder.decode([Team].self, from: data)

                DispatchQueue.main.async {
                    self.tableView.reloadData()

                    // Print out all the team names in the console
                    for team in self.teams {
                        print(team.name)
                    }
                }
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
                return
            }
        }
        
        task.resume()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // We only have one section in this table
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of teams in the list
        return teams.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell from the table view with an identifier defined in the Storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath)

        // Configure the cell with the team name
        cell.textLabel?.text = teams[indexPath.row].name

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTeamDetails" {
            // Get the selected team
            if let indexPath = tableView.indexPathForSelectedRow {
                let team = teams[indexPath.row]
                
                // Get the destination view controller
                let destinationVC = segue.destination as! TeamDetailViewController
                
                // Pass the team's data to the destination view controller
//                destinationVC.team = team
            }
        }
    }
}
