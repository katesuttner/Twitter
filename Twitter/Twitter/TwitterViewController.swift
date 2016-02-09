//
//  TwitterViewController.swift
//  Twitter
//
//  Created by Kate Suttner on 2/7/16.
//  Copyright © 2016 CodePath. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogin(sender: AnyObject) {
        //        TwitterClient.sharedInstance.loginWithBlock() {
        //            // go to next screen
        //
        //        }
        
        TwitterClient.sharedInstance.loginWithCompletion() {
            (user: User?, error: NSError?) in
            if user != nil {
                self.performSegueWithIdentifier("loginSegue", sender: self);
            } else {
                // handle error
            }
        }
        
    }
    
}