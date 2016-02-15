//
//  TweetCell.swift
//  Twitter
//
//  Created by Kate Suttner on 2/14/16.
//  Copyright © 2016 CodePath. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var favouriteCount: UILabel!
    
    
    @IBAction func likeButton(sender: AnyObject) {
    }
    
    @IBAction func retweetButton(sender: AnyObject) {
    }
    
    @IBAction func replyButton(sender: AnyObject) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
