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
    var feeds = [Feed]()
//MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fillFeeds()
    }
    
    private func configure() {
        self.view.applyGradient(colours: [#colorLiteral(red: 0.1607843137, green: 0.5019607843, blue: 0.7254901961, alpha: 1), UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)])
        self.tableView.backgroundColor = .clear
        self.navigationItem.title = "Feed"
        let cellNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "feedCell")
    }
    

    private func fillFeeds() {
        feeds.append(Feed(feedTitle: "Dollar falls", feedText: nil, likes: nil, comments: nil, views: nil, feedImage: nil))
        feeds.append(Feed(feedTitle: "Today's weather", feedText: nil, likes: nil, comments: nil, views: nil, feedImage: nil))
        feeds.append(Feed(feedTitle: "New BMW concept", feedText: nil, likes: nil, comments: nil, views: nil, feedImage: nil))
        feeds.append(Feed(feedTitle: "Accident in New York", feedText: nil, likes: nil, comments: nil, views: nil, feedImage: nil))
        feeds.append(Feed(feedTitle: "New feeds soon", feedText: nil, likes: nil, comments: nil, views: nil, feedImage: nil))
    }

}

//MARK: Extensions

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let feedCell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()
        }
        
        feedCell.feedName.text = feeds[indexPath.row].feedTitle
        feedCell.likeButton.titleLabel?.text = String(Int.random(in: 0...1000))
        feedCell.viewsButton.titleLabel?.text = String(Int.random(in: 0...1000))
        feedCell.commentButton.titleLabel?.text = String(Int.random(in: 0...1000))
        feedCell.feedImageView.image = UIImage(named: feeds[indexPath.row].feedTitle)
        feeds[indexPath.row].feedImage = feedCell.feedImageView.image
        return feedCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let currentImage = feeds[indexPath.row].feedImage else { return 100 }
        let imageCrop = currentImage.getCropRatio()
        return (tableView.frame.width + 100) / imageCrop
    }
}

extension UIImage {
    func getCropRatio() -> CGFloat {
        let widthRatio = CGFloat(self.size.width / self.size.height)
        return widthRatio
    }
}
