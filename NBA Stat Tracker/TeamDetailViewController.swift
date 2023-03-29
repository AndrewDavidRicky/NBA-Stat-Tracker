import UIKit

class TeamDetailViewController: UIViewController {
    
    @IBOutlet weak var Tets: UILabel!
    @IBOutlet weak var Game1: UITableViewCell!
    var teamName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Tets.text = teamName

    }
    
}
