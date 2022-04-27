//
//  LoginViewController.swift
//  Login & Registration
//
//  Created by rnw on 25/02/22.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField(textField: userNameTextField)
        setUpTextField(textField: passwordTextField)
        setButton(button: signInButton)
    }
    
    func setButton(button: UIButton) {
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 10
    }
    
    //MARK: - text Field
    
    private func setUpTextField(textField: UITextField) {
//        textField.layer.cornerRadius =
//        textField.layer.masksToBounds = true
//        textField.layer.borderWidth = 2
//        textField.layer.borderColor = UIColor.black.cgColor
        textField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func logInButtonClick(_ sender: UIButton) {
        if userNameTextField.text == "" || passwordTextField.text == "" {
            if userNameTextField.text == "" && passwordTextField.text == "" {
                blankValueAlert()
            }
            
            else if userNameTextField.text == "" {
                enterUserNameAlert()
            }
            
            else if passwordTextField.text == "" {
                enterPasswordAlert()
            }
            
        } else {
            navigateToHomePage()
        }
    }
    
    func blankValueAlert() {
        let alert: UIAlertController = UIAlertController (title: "Error", message: "Plase fill information", preferredStyle: .alert)
        
        let okayButton: UIAlertAction = UIAlertAction(title: "okay", style: .default, handler: nil)
        
        alert.addAction(okayButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func enterUserNameAlert() {
        let alert: UIAlertController = UIAlertController(title: "Username", message: "Please Enter Username", preferredStyle: .alert)
        let okayButton: UIAlertAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(okayButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func enterPasswordAlert() {
        let alert: UIAlertController = UIAlertController(title: "Password", message: "Please Enter Password", preferredStyle: .alert)
        let okayButton: UIAlertAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(okayButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func navigateToHomePage() {
        let mainStroyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController: HomeViewController = mainStroyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        homeViewController.information = Information(userName: userNameTextField.text ?? "", password: passwordTextField.text ?? "")
        
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}
