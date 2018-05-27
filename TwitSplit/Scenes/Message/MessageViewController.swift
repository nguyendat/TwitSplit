//
//  ViewController.swift
//  TwitSplit
//
//  Created by Ta-Cuong Nguyen on 5/22/18.
//  Copyright © 2018 Ta-Cuong Nguyen. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    @IBOutlet weak var messageTextView: UITextView!
    var messageTweet = String()
    var messageArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Send Tweet"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendTweetClick(_ sender: Any) {
        let tweetViewController = TweetViewController()
        self.messageTweet = messageTextView.text
        self.messageArray = TweetSplitAlgorithm.splitMessage(self.messageTweet)
        tweetViewController.messageArray = messageArray
        self.navigationController?.pushViewController(tweetViewController, animated: true)
    }
    
}

