//
//  ProfilePage.swift
//  Homework16TMS_Khadatovich
//
//  Created by Yury Khadatovich on 6.11.21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var friendsButton: UIButton!
    @IBOutlet weak var feedButton: UIButton!
    
    //MARK: Properties
    var transferredText = ""
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        self.showAlertOneButton(alertTitle: "Hello!", alertMessage: "Welcome to iSocial", actionTitle: "Start exploring")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shareButton.isEnabled = UserDefaults.standard.bool(forKey: "shareSwitchState")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SettingsSegue" else { return }
        guard let destination = segue.destination as? SettingsViewController else { return }
        destination.textFromMainPage = transferredText
    }
    
    private func config() {
        let appMainColor = UIColor(red: 165, green: 200, blue: 210, alpha: 1)
        self.view.applyGradient(colours: [#colorLiteral(red: 0.1607843137, green: 0.5019607843, blue: 0.7254901961, alpha: 1), UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)])
        nameLabel.text = currentUser.getFirstName()
        nameLabel.textColor = appMainColor
        lastNameLabel.text = currentUser.getLastName()
        lastNameLabel.textColor = appMainColor
        ageLabel.text = currentUser.ageToString
        ageLabel.textColor = appMainColor
        signOutButton.backgroundColor = UIColor(white: 1, alpha: 0.1)
        avatarView.layer.cornerRadius = self.avatarView.frame.height / 2
        friendsButton.backgroundColor = UIColor(white: 1, alpha: 0.1)
        friendsButton.layer.cornerRadius = self.friendsButton.frame.height / 2
        feedButton.backgroundColor = UIColor(white: 1, alpha: 0.1)
        feedButton.layer.cornerRadius = self.feedButton.frame.height / 2
    }
    
    //MARK: IBActions
    @IBAction func didPressShareButton() {
        shareButton.pulsate()
        print(currentUser.getLogin())
        print(currentUser.getPassword())
    }
    @IBAction func didPressSettingsButton() {
        settingsButton.pulsate()
        performSegue(withIdentifier: "SettingsSegue", sender: nil)
    }
    @IBAction func didPressSignOutButton() {
        signOutButton.pulsate()
        showSignOutAlert(alertTitle: "Sign Out", alertMessage: "Are you sure?", firstActionTitle: "No", secondActionTitle: "Sign out")
        //        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func didPressFriendsButton() {
        friendsButton.pulsate()
    }
    @IBAction func didPressFeedButton(_ sender: Any) {
        feedButton.pulsate()
    }
}
