//
//  TwitterClient.swift
//  Twitter
//
//  Created by Kate Suttner on 2/7/16.
//  Copyright © 2016 CodePath. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "0qSJZTS532jSXMlND4zwH7W6P"
let twitterConsumerSecret = "9QZX0fgh7KOqCBE9nxZNbAoGs1MxkflifqCP8BY8YDw4hQrx21"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")


class TwitterClient: BDBOAuth1RequestOperationManager {
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(
                baseURL: twitterBaseURL,
                consumerKey: twitterConsumerKey,
                consumerSecret: twitterConsumerSecret
        )
        }
        return Static.instance
    }

}
