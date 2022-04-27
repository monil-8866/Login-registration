//
//  ViewController.swift
//  Login & Registration
//
//  Created by rnw on 24/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton(button: signUpButton)
        setButton(button: signInButton)
    }
    
    func setButton(button: UIButton) {
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 27
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
        let mainStroyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signinViewController: SignUpViewController = mainStroyBoard.instantiateViewController(withIdentifier: "SigninViewController") as! SignUpViewController
        navigationController?.pushViewController(signinViewController, animated: true)
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        let mainStroyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let logInViewController: SignInViewController = mainStroyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! SignInViewController
        navigationController?.pushViewController(logInViewController, animated: true)
    }
    
    
}

