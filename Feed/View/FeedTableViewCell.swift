//
//  FeedTableViewCell.swift
//  iSocial
//
//  Created by Yury Khadatovich on 5.12.21.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    //MARK: Outlets
    @IBOutlet weak var feedName: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var viewsButton: UIButton!
    @IBOutlet weak var feedImageView: UIImageView!
    
    //MARK: Methods
    override func layoutSubviews() {
        self.backgroundColor = .clear
        feedName.textColor = .white
        feedImageView.translatesAutoresizingMaskIntoConstraints = false
    }
}
