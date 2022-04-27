//
//  SigninViewController.swift
//  Login & Registration
//
//  Created by rnw on 25/02/22.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var genderPickerView: UIPickerView!
    @IBOutlet weak var selectGenderTextField: UITextField!
    @IBOutlet weak var hidePasswordButton: UIButton!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPickerView()
        setUpTextFields()
        setButton(button: submitButton)
        hidePasswordButton.isHidden = true
    }
    
    func setButton(button: UIButton) {
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 15
    }
    
    func setUpTextFields() {
        setUpTextField(textField: userNameTextField)
        setUpTextField(textField: phoneNumberTextField)
        setUpTextField(textField: emailTextField)
        setUpTextField(textField: passwordTextField)
        setUpTextField(textField: selectGenderTextField)
        
        setUpTextFieldSingleLine(textField: userNameTextField)
        setUpTextFieldSingleLine(textField: phoneNumberTextField)
        setUpTextFieldSingleLine(textField: emailTextField)
        setUpTextFieldSingleLine(textField: passwordTextField)
        setUpTextFieldSingleLine(textField: selectGenderTextField)
    }
    
    private func setUpTextFieldSingleLine(textField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2 , width: textField.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.black.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
    }
    
    //MARK: - text Field
    
    private func setUpTextField(textField: UITextField) {
        
        textField.delegate = self
        userNameTextField.tag = 0
        phoneNumberTextField.tag = 1
        emailTextField.tag = 2
        passwordTextField.tag = 3
        selectGenderTextField.tag = 4
    }
    
    //MARK: - set Picker View
    
    func setUpPickerView() {
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        selectGenderTextField.delegate = self
        genderPickerView.isHidden = true
    }
    
    var arrGender: [String] = ["Male", "Female", "Other"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrGender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrGender[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectGenderTextField.text = arrGender[row]
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        genderPickerView.isHidden = false
        switch textField.tag {
        case 0: return true
        case 1: return true
        case 2: return true
        case 3: return true
        case 4: return false
        default: break
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        genderPickerView.isHidden = true
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    //MARK: - submit Button
    
    @IBAction func submitButton(_ sender: UIButton) {
        if userNameTextField.text == "" || phoneNumberTextField.text == "" || emailTextField.text == "" || passwordTextField.text == "" || passwordTextField.text!.count < 8 || selectGenderTextField.text == "" {
            
            if userNameTextField.text == "" && phoneNumberTextField.text == "" && emailTextField.text == "" && passwordTextField.text == ""  {
                blankValueAlert()
            } else if userNameTextField.text == "" {
                enterUserNameAlert()
            } else if phoneNumberTextField.text == "" {
                enterPhoneNumberAlert()
            }
            
            else if emailTextField.text == "" {
                enterEmailAlert()
            }
            
            else if passwordTextField.text == "" {
                enterPasswordAlert()
            }
            
            else if passwordTextField.text!.count <= 8 {
                passwordNotValidAlert()
            }
            
            else if selectGenderTextField.text == "" {
                selectGenderAlert()
            }
        } else {
            navigateToHomePage()
        }
    }
    
    func enterEmailAlert() {
        let alert: UIAlertController = UIAlertController(title: "Email", message: "Please Enter Email", preferredStyle: .alert)
        let okayButton: UIAlertAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(okayButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func enterPhoneNumberAlert() {
        let alert: UIAlertController = UIAlertController(title: "Phone Number", message: "Please Enter Phone Number", preferredStyle: .alert)
        
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
    
    func enterUserNameAlert() {
        let alert: UIAlertController = UIAlertController(title: "Username", message: "Please Enter Username", preferredStyle: .alert)
        let okayButton: UIAlertAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(okayButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func passwordNotValidAlert() {
        let alert: UIAlertController = UIAlertController(title: "Invalide Password", message: "Password must has minimum 8 charecter", preferredStyle: .alert)
        let okayButton: UIAlertAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(okayButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func blankValueAlert() {
        let alert: UIAlertController = UIAlertController (title: "Error", message: "Plase fill information", preferredStyle: .alert)
        
        let okayButton: UIAlertAction = UIAlertAction(title: "okay", style: .default, handler: nil)
        
        alert.addAction(okayButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func selectGenderAlert() {
        let alert: UIAlertController = UIAlertController(title: "Select Gender", message: "Please Select Gender", preferredStyle: .alert)
        let okayButton: UIAlertAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(okayButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func navigateToHomePage() {
        //        let mainStroyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //        let signingSuccessViewController: SigningSuccessViewController = mainStroyBoard.instantiateViewController(withIdentifier: "SigningSuccessViewController") as! SigningSuccessViewController
        //
        //        navigationController?.pushViewController(signingSuccessViewController, animated: true)
        
        let success = storyboard?.instantiateViewController(identifier: "SigningSuccessViewController") as! SigningSuccessViewController
        navigationController?.pushViewController(success, animated: true)
        //        navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: - hide password
    
    @IBAction func hidePasswordButtonClick(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = true
        hidePasswordButton.isHidden = true
        showPasswordButton.isHidden = false
    }
    
    //MARK: - show password
    
    @IBAction func showPasswordButtonClick(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = false
        hidePasswordButton.isHidden = false
        showPasswordButton.isHidden = true
    }
    
    
    
}
