//
//  ViewController.swift
//  Homework16TMS_Khadatovich
//
//  Created by Yury Khadatovich on 4.11.21.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var spacingView: UIView!
    @IBOutlet weak var testTextField: UITextField!
    @IBOutlet weak var iSocialLabel: UILabel!
    @IBOutlet weak var infoTextfield: UITextField!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var infoText: UILabel!
    @IBOutlet weak var loadingCircle1View: UIView!
    @IBOutlet weak var loadingCircle2View: UIView!
    @IBOutlet weak var loadingCircle3View: UIView!
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "profileSegue" else { return }
        guard let destination = segue.destination as? ProfileViewController else { return }
        if testTextField.text == ""  {
            destination.transferredText = "There is no text."
        } else {
            destination.transferredText = testTextField.text!
        }
    }
    
    private func config() {
        let appMainColor = UIColor(red: 165, green: 200, blue: 210, alpha: 1)
        self.view.applyGradient(colours: [#colorLiteral(red: 0.1607843137, green: 0.5019607843, blue: 0.7254901961, alpha: 1), UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)])
        
        iSocialLabel.textColor = appMainColor
        spacingView.backgroundColor = UIColor(red: 55, green: 164, blue: 189, alpha: 0)
        loginTextField.layer.cornerRadius = self.loginTextField.frame.height / 2
        loginTextField.textContentType = UITextContentType.emailAddress
        loginTextField.clearButtonMode = .always
        loginTextField.keyboardType = .emailAddress
        loginTextField.textColor = .black
        loginTextField.backgroundColor = .white
        loginTextField.tintColor = .black
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = UITextContentType.password
        passwordTextField.clearButtonMode = .always
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = .black
        passwordTextField.tintColor = .black
        
        
        signInButton.layer.cornerRadius = self.signInButton.frame.height / 2
        signInButton.backgroundColor = UIColor(white: 1, alpha: 0.1)
        errorLabel.isHidden = true
        infoText.textColor = .white
        infoTextfield.backgroundColor = .white
        infoTextfield.textColor = .black
        infoTextfield.tintColor = .black
        signUpLabel.textColor = .white
        
        loadingCircle1View.layer.cornerRadius = self.loadingCircle1View.frame.height / 2
        loadingCircle2View.layer.cornerRadius = self.loadingCircle1View.frame.height / 2
        loadingCircle3View.layer.cornerRadius = self.loadingCircle1View.frame.height / 2
        
    }
    
    private func animate() {
        UIView.animateKeyframes(
            withDuration: 0.9,
            delay: 0,
            options: [.repeat],
            animations: {
                // Анимация отдельного кадра
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.3,
                    animations: {
                        self.loadingCircle1View.alpha = 0
                        self.loadingCircle2View.alpha = 1
                        self.loadingCircle3View.alpha = 1
                    })
                UIView.addKeyframe(
                    withRelativeStartTime: 0.3,
                    relativeDuration: 0.6,
                    animations: {
                        self.loadingCircle1View.alpha = 1
                        self.loadingCircle2View.alpha = 0
                        self.loadingCircle3View.alpha = 1
                    })
                UIView.addKeyframe(
                    withRelativeStartTime: 0.6,
                    relativeDuration: 0.9,
                    animations: {
                        self.loadingCircle1View.alpha = 1
                        self.loadingCircle2View.alpha = 1
                        self.loadingCircle3View.alpha = 0
                    })
            })
    }
    
    
    private func isValidEmail(email: String?) -> Bool {
        guard email != nil else { return false }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
    
    private func isValidPassword(password: String?) -> Bool {
        guard password != nil else { return false }
        
        let passordRegEx = "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{6}$"
        
        //        ^                         Start anchor
        //        (?=.*[A-Z].*[A-Z])        Ensure string has two uppercase letters.
        //        (?=.*[!@#$&*])            Ensure string has one special case letter.
        //        (?=.*[0-9].*[0-9])        Ensure string has two digits.
        //        (?=.*[a-z].*[a-z].*[a-z]) Ensure string has three lowercase letters.
        //        .{6}                      Ensure string is of length 6.
        //        $                         End anchor.
        
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passordRegEx)
        
        return passwordPred.evaluate(with: password)
    }
    
    private func isCredentialsCorrect() -> Bool {
        let minLength = 6
        let login = loginTextField.text
        let password = passwordTextField.text
        
        guard password != "" && login != ""  else {
            showError(code: 2)
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
            if user.getLogin() == login && user.getPassword() == password {
                rememberUser(toRemember: user, memoryUser: &currentUser)
                return true
            }
        }
        
        showError(code: 4)
        return false
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
            errorLabel.text = "Invalid credentials"
        default:
            errorLabel.text = "Error"
        }
        errorLabel.isHidden = false
    }
    
//MARK: IBActions
    @IBAction func didPressSignInButton() {
        signInButton.pulsate()
    //uncomment when release
//        let accessGranted = isCredentialsCorrect()
//        if accessGranted {
//            performSegue(withIdentifier: "profileSegue", sender: nil)
//        }
        performSegue(withIdentifier: "profileSegue", sender: nil)
    }
    
    @IBAction func didPressSignUpButton() {
        signUpButton.pulsate()
        performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
}

//MARK: Extensions
extension UIView {
    func roundCorners(withRadius: Double ) {
        self.layer.cornerRadius = withRadius
    }
}

extension UIView {
    func applyGradient(colours: [UIColor], cornerRadius: CGFloat) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = nil
        gradient.cornerRadius = cornerRadius
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradient(colours: [UIColor]) {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
}

extension UIViewController {
    internal func showAlertOneButton(alertTitle: String, alertMessage: String, actionTitle: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    internal func showSignOutAlert(alertTitle: String, alertMessage: String, firstActionTitle: String, secondActionTitle: String) {
        let alert = UIAlertController(title: title, message: alertMessage, preferredStyle: .alert)
        let firstAction = UIAlertAction(title: firstActionTitle, style: .cancel, handler: nil)
        let secondAction = UIAlertAction(title: secondActionTitle, style: .destructive, handler: {(_: UIAlertAction!) in
            self.navigationController?.popToRootViewController(animated: true)
        })
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.3
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        layer.add(pulse, forKey: nil)
    }
}
