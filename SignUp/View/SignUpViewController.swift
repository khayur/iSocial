//
//  SignUpViewController.swift
//  Homework16TMS_Khadatovich
//
//  Created by Yury Khadatovich on 7.11.21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var spasingView: UIView!
    @IBOutlet weak var footerLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
//MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        self.hideKeyboardWhenTappedAround()
    }
    
    private func config() {
        let appMainColor = UIColor(red: 165, green: 200, blue: 210, alpha: 1)
        self.view.applyGradient(colours: [#colorLiteral(red: 0.1607843137, green: 0.5019607843, blue: 0.7254901961, alpha: 1), UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)])
        
        spasingView.backgroundColor = UIColor(red: 55, green: 164, blue: 189, alpha: 0)
        
        signUpButton.layer.cornerRadius = self.signUpButton.frame.height / 2
        signUpButton.backgroundColor = UIColor(white: 1, alpha: 0.1)
        errorLabel.textColor = .red
        errorLabel.isHidden = true
        welcomeLabel.textColor = appMainColor
        firstNameTextField.clearButtonMode = .always
        firstNameTextField.backgroundColor = .white
        firstNameTextField.textColor = .black
        firstNameTextField.tintColor = .black
        firstNameLabel.textColor = .white
        lastNameTextField.clearButtonMode = .always
        lastNameTextField.backgroundColor = .white
        lastNameTextField.textColor = .black
        lastNameTextField.tintColor = .black
        lastNameLabel.textColor = .white
        ageTextField.clearButtonMode = .always
        ageTextField.backgroundColor = .white
        ageTextField.textColor = .black
        ageTextField.tintColor = .black
        ageLabel.textColor = .white
        loginTextField.clearButtonMode = .always
        loginTextField.keyboardType = .emailAddress
        loginTextField.backgroundColor = .white
        loginTextField.textColor = .black
        loginTextField.tintColor = .black
        loginLabel.textColor = .white
        passwordTextField.clearButtonMode = .always
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = .black
        passwordTextField.tintColor = .black
        passwordLabel.textColor = .white
        footerLabel.textColor = .white
    }
    
    private func isValidEmail(email: String?) -> Bool {
        
        guard email != nil else { return false }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
    
    private func addNewUser() {
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let ageString = ageTextField.text
        let age = Int(ageString!)
        let login = loginTextField.text
        let password = passwordTextField.text
        
        dataBase.append(User(firstName: firstName, lastName: lastName, age: age, login: login, password: password))
    }
    
    private func isInformationCorrect() -> Bool {
        let minLength = 6
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let ageString = ageTextField.text
        let age = Int(ageString!)
        let login = loginTextField.text
        let password = passwordTextField.text
        
        let isFieldsContainData = firstName != nil && lastName != nil && ageString != nil && login != nil && password != nil && firstName != "" && lastName != "" && ageString != "" && login != "" && password != ""
        
        guard isFieldsContainData else {
            showError(code: 2)
            return false
        }
        
        if age == nil {
            showError(code: 4)
            return false
        }
        
        if !isValidEmail(email: login!) {
            showError(code: 3)
            return false
        }
        
        if password!.count < minLength {
            showError(code: 1)
            return false
        }
        
        for user in dataBase {
            if user.login == login {
                showError(code: 5)
                return false
            }
        }
        currentUser.login = login
        currentUser.password = password
        currentUser.firstName = firstName
        currentUser.lastName = lastName
        currentUser.age = age
        
        return true
    }
    
    private func showError(code: Int) {
        switch code {
        case 1:
            errorLabel.text = "Lenght of password is less than 6 charcters"
        case 2:
            errorLabel.text = "Fill in all fields"
        case 3:
            errorLabel.text = "Invalid email"
        case 4:
            errorLabel.text = "Age must contain only numbers"
        case 5:
            errorLabel.text = "The user with this email already exists"
        default:
            errorLabel.text = "Error"
        }
        
        errorLabel.isHidden = false
    }
    
    //MARK: IBActions
    @IBAction func didPressSignUpButton() {
        signUpButton.pulsate()
        if isInformationCorrect() {
            addNewUser()
            performSegue(withIdentifier: "profileSegue", sender: nil)
        }
    }
    
    @IBAction func didPressSignInButton() {
        signInButton.pulsate()
        //        performSegue(withIdentifier: "signInSegue", sender: nil)
        self.navigationController?.popToRootViewController(animated: true)
        
    }
}

