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

            // Decode the JSON data into an array of Team objects
            do {
                self.teams = try JSONDecoder().decode([Team].self, from: data)

                // Reload the table view on the main thread
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("Error decoding JSON: \(error)")
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

        // Center the text in the cell
        cell.textLabel?.textAlignment = .center

        // Round the corners of the cell
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true

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
                destinationVC.teamID = team.teamID
                destinationVC.name = team.name
                destinationVC.wikipediaLogoUrl = team.wikipediaLogoUrl
                destinationVC.teamKey = team.key
            }
        }
    }

}
