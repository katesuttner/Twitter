//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Kate Suttner on 2/8/16.
//  Copyright © 2016 CodePath. All rights reserved.
//

import AFNetworking
import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var tweets: [Tweet]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // autoresizing for the cell
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)

        // Do any additional setup after loading the view.
        TwitterClient.sharedInstance.homeTimelineWithParams(nil, completion: { (tweets, error) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let tweeeeeet = self.tweets {
            return tweeeeeet.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
        
        cell.nameLabel.text = tweets![indexPath.row].user!.name!
        cell.profileImageView.setImageWithURL(NSURL(string: tweets![indexPath.row].user!.profileImageUrl!)!)
       //Added 2/17/16
        
        cell.timeStampLabel.text = calculateTimeStamp(tweets![indexPath.row].createdAt!.timeIntervalSinceNow)
       // cell.timeStampLabel.text = tweets![indexPath.row].createdAt
        cell.screenNameLabel.text = tweets![indexPath.row].user!.screenname
        cell.tweetTextLabel.text=tweets![indexPath.row].text
//        cell.retweetButton.setImage(<#T##image: UIImage?##UIImage?#>, forState: <#T##UIControlState#>)
        //cell.favouriteCount.setImage
//        cell.replyButton.setImage(<#T##image: UIImage?##UIImage?#>, forState: <#T##UIControlState#>)
//        cell.retweetButton.setImage(<#T##image: UIImage?##UIImage?#>, forState: <#T##UIControlState#>)
//        cell.likeButton.setImage(<#T##image: UIImage?##UIImage?#>, forState: <#T##UIControlState#>)
        
        
        
        return cell
    }
    
    
    //This function is curtsey of @r3dcrosse
    func calculateTimeStamp(timeTweetPostedAgo: NSTimeInterval) -> String {
        // Turn timeTweetPostedAgo into seconds, minutes, hours, days, or years
        var rawTime = Int(timeTweetPostedAgo)
        var timeAgo: Int = 0
        var timeChar = ""
        
        rawTime = rawTime * (-1)
        
        // Figure out time ago
        if (rawTime <= 60) { // SECONDS
            timeAgo = rawTime
            timeChar = "s"
        } else if ((rawTime/60) <= 60) { // MINUTES
            timeAgo = rawTime/60
            timeChar = "m"
        } else if (rawTime/60/60 <= 24) { // HOURS
            timeAgo = rawTime/60/60
            timeChar = "h"
        } else if (rawTime/60/60/24 <= 365) { // DAYS
            timeAgo = rawTime/60/60/24
            timeChar = "d"
        } else if (rawTime/(3153600) <= 1) { // YEARS
            timeAgo = rawTime/60/60/24/365
            timeChar = "y"
        }
        
        return "\(timeAgo)\(timeChar)"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
