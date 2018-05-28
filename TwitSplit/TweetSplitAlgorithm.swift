//
//  TweetSplitAlgorithm.swift
//  TwitSplit
//
//  Created by Ta-Cuong Nguyen on 5/22/18.
//  Copyright © 2018 Ta-Cuong Nguyen. All rights reserved.
//

import Foundation

struct Result {
    let subTweets: [String]
    let success: Bool
}

class TweetSplitAlgorithm {
    static func splitMessage(_ msg: String, maxTweetLength length: Int = 50) -> [String] {
        
       let tweetString = msg.standardizedWhitespace
        //Check string empty
        if tweetString.count == 0 {
            return []
        }
        
        if tweetString.count <= length {
            return([tweetString])
        }
        
        let parts = tweetString.components(separatedBy:" ")
        //Check string more than 50 chracters
        for item in parts {
            if item.count > 50 {
                return []
            }
        }
        
        var maxNumberSubTweet = 1
        var count = 0
        while true {
            let result = combineMessages(parts, withMaxNumberSubTweet: maxNumberSubTweet, AndMaximumTweetLength: length)
            if result.success {
                return result.subTweets
            } else {
                count = count + 1
                maxNumberSubTweet = Int(powf(10.0, Float(count))) - 1;
            }
        }
    }
    
    static func combineMessages(_ msgs:[String], withMaxNumberSubTweet maxNumberSubTweet: Int, AndMaximumTweetLength maxTweetLength: Int) -> Result {
        var sentence: String = msgs.first!
        var results: [String] = []
        var numberSubTweet = 1
        var maxSubTweetLength = maxTweetLength - lengthOfIndicator(numberSubTweet, andMaxNumberOfSubTweet: maxNumberSubTweet)
        for index in 1..<(msgs.count) {
            let msg  = msgs[index]
            if (sentence.count + msg.count + 1) <= maxSubTweetLength {
                sentence = "\(sentence) \(msg)"
            } else {
                results.append(sentence)
                numberSubTweet = numberSubTweet + 1
                maxSubTweetLength = maxTweetLength - lengthOfIndicator(numberSubTweet, andMaxNumberOfSubTweet: maxNumberSubTweet)
                sentence = msg
            }
            if numberSubTweet > maxNumberSubTweet {
                return Result(subTweets: [], success: false)
            }
        }
        results.append(sentence)
        
        // add indicator when number of sub tweet great than 1.
        for (i, sentence) in results.enumerated() {
            results[i] = "\(i+1)/\(numberSubTweet) \(sentence)"
        }
        return Result(subTweets:results, success: true)
    }
    
    //Caculate length of indicator 1/10 => Return 5 ( 1 for space).
    static func lengthOfIndicator(_ indexOfPartition: Int, andMaxNumberOfSubTweet number: Int) -> Int {
        return "\(indexOfPartition)/\(number) ".count
    }
}

extension String {
    var standardizedWhitespace: String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}
