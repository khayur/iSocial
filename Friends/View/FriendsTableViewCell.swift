//
//  FriendsTableViewCell.swift
//  iSocial
//
//  Created by Yury Khadatovich on 5.12.21.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
//MARK: Outlets

    @IBOutlet weak var profileSmallImageView: UIImageView!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    
//MARK: Methods
    override func layoutSubviews() {
        self.backgroundColor = .clear
        self.profileSmallImageView.layer.cornerRadius = self.profileSmallImageView.frame.height / 2
        firstNameLabel.textColor = .white
        lastNameLabel.textColor = .white
        
    }
    
    
}
