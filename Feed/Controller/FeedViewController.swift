//
//  FeedViewController.swift
//  iSocial
//
//  Created by Yury Khadatovich on 5.12.21.
//

import UIKit

class FeedViewController: UIViewController {
//MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
//MARK: Proterties
    
//MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func configure() {
        self.view.applyGradient(colours: [#colorLiteral(red: 0.1607843137, green: 0.5019607843, blue: 0.7254901961, alpha: 1), UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)])
        
        self.tableView.backgroundColor = .clear
        self.navigationItem.title = "Friends"
        let cellNib = UINib(nibName: "FriendsTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CustomFriendsCell")
    }

}

//MARK: Extensions

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
