//
//  SettingsPage.swift
//  Homework16TMS_Khadatovich
//
//  Created by Yury Khadatovich on 6.11.21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var loginLabelSettingsPage: UILabel!
    @IBOutlet weak var passwordLabelSettingsPage: UILabel!
    @IBOutlet weak var shareSwitch: UISwitch!
    @IBOutlet weak var mainPageTextfieldText: UILabel!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var activatingLabel: UILabel!
    @IBOutlet weak var textFromProfilePageLabel: UILabel!
    @IBOutlet weak var setActionLabel: UILabel!
    //MARK: Properties
    var textFromMainPage = "Error: There is nothing do display"
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    private func config() {
        let appMainColor = UIColor(red: 165, green: 200, blue: 210, alpha: 1)
        self.view.applyGradient(colours: [#colorLiteral(red: 0.1607843137, green: 0.5019607843, blue: 0.7254901961, alpha: 1), UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)])
        loginLabel.textColor = .white
        loginLabelSettingsPage.text = currentUser.getLogin()
        loginLabelSettingsPage.textColor = .white
        passwordLabelSettingsPage.text = currentUser.getPassword()
        passwordLabelSettingsPage.textColor = .white
        shareSwitch.isOn = UserDefaults.standard.bool(forKey: "shareSwitchState")
        mainPageTextfieldText.text = textFromMainPage
        mainPageTextfieldText.textColor = .white
        passwordLabel.textColor = .white
        activatingLabel.textColor = .white
        textFromProfilePageLabel.textColor = .white
        setActionLabel.textColor = .white
    }
    
    //MARK: IBActions
    @IBAction func didPressShareSwitch(_ sender: UISwitch) {
        if shareSwitch.isOn == true {
            print("On")
        } else {
            print("Off")
        }
        UserDefaults.standard.set(shareSwitch.isOn, forKey: "shareSwitchState")
    }
}
