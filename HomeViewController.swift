import UIKit

struct Information {
    var userName: String
    var password: String
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var showDetailButton: UIButton!
    var hide = true
    
    var information: Information = Information(userName: "",password: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.isHidden = true
        passwordLabel.isHidden = true
        
        emailLabel.text = "UserName: \(information.userName)"
        passwordLabel.text = "Password: \(information.password)"
    }
    
    @IBAction func showButton(_ sender: UIButton) {
        if hide == true {
            emailLabel.isHidden = false
            passwordLabel.isHidden = false
            hide = false
        } else {
            emailLabel.isHidden = true
            passwordLabel.isHidden = true
            hide = true
        }
    }
    
    
}
