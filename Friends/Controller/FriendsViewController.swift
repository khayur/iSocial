//
//  FriendsViewController.swift
//  iSocial
//
//  Created by Yury Khadatovich on 5.12.21.
//

import UIKit

class FriendsViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    var friends = [Friend]()
    var sections = [String]()
    var sectionsContent = [String : [Friend?]]()

    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fillFriendsArray()
        fillSectionsArray()
        fillSectionsContent()
        configure()
    }
    
    private func configure() {
        self.view.applyGradient(colours: [#colorLiteral(red: 0.1607843137, green: 0.5019607843, blue: 0.7254901961, alpha: 1), UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)])
        self.tableView.backgroundColor = .clear
        self.navigationItem.title = "Friends"
        let cellNib = UINib(nibName: "FriendsTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CustomFriendsCell")
        
    }
    
    private func fillFriendsArray() {
        friends.append(Friend(firstName: "John", lastName: "Appleseed"))
        friends.append(Friend(firstName: "Andrey", lastName: "Matoshko"))
        friends.append(Friend(firstName: "Nikita", lastName: "Meduza"))
        friends.append(Friend(firstName: "Evgeny", lastName: "Gordey"))
        friends.append(Friend(firstName: "Hleb", lastName: "Rastsisheuski"))
        friends.append(Friend(firstName: "Pavel", lastName: "Miskevich"))
        friends.append(Friend(firstName: "Artsem", lastName: "Kutasevich"))
        friends.append(Friend(firstName: "Stas", lastName: "ProstoKlass"))
        friends.append(Friend(firstName: "Tanya", lastName: "Sokolinskaya"))
        friends.append(Friend(firstName: "Denis", lastName: "Orlov"))
    }
    
    private func fillSectionsArray() {
        for friend in friends {
            let firstCharacter = String(friend.lastName.prefix(1))
            if !sections.contains(firstCharacter) {
                sections.append(firstCharacter)
            }
            sections = sections.sorted(by: <)
        }
    }
    
    private func fillSectionsContent() {
        for section in sections {
            for friend in friends {
                if section == String(friend.lastName.prefix(1)){
                    sectionsContent[section, default: [Friend]()].append(friend)
                }
            }
        }
    }
}


//MARK: Extensions
extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let keysArray = Array(sectionsContent.keys).sorted(by: <)
        let friendsInSectionArray = sectionsContent[keysArray[section]]
        
        guard let rows = friendsInSectionArray?.count else { return 0 }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendsCell = tableView.dequeueReusableCell(withIdentifier: "CustomFriendsCell", for: indexPath) as? FriendsTableViewCell else {
            return UITableViewCell()
        }
        
        let keysArray = Array(sectionsContent.keys).sorted(by: <)
        let section = indexPath.section
        let row = indexPath.row
        let currentFriendsSection = sectionsContent[keysArray[section]]
        let firstName = currentFriendsSection?[row]?.firstName
        let lastName = currentFriendsSection?[row]?.lastName
        friendsCell.firstNameLabel.text = firstName
        friendsCell.lastNameLabel.text = lastName

        friendsCell.profileSmallImageView.image = UIImage(named: firstName ?? "")
        return friendsCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: -3, width: headerView.frame.width, height: headerView.frame.height - 10)
        label.text = sections[section]
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
