//
//  FriendsHeaderFooter.swift
//  iSocial
//
//  Created by Yury Khadatovich on 5.12.21.
//

import UIKit

class FriendsHeaderFooter: UITableViewHeaderFooterView {

    @IBOutlet weak var sectionNameLabel: UILabel!
    
    override func layoutSubviews() {
        sectionNameLabel.textColor = .white
        self.backgroundColor = .clear
    }
    
}
