//
//  TweetSplitAlgorithm.swift
//  TwitSplit
//
//  Created by Ta-Cuong Nguyen on 5/22/18.
//  Copyright © 2018 Ta-Cuong Nguyen. All rights reserved.
//

import Foundation

class TweetSplitAlgorithm {
    static func splitMessage(_ msg: String) -> [String] {
        
       let tweetString = msg.trimmingCharacters(in: .whitespaces)
        
        if tweetString.count == 0 {
            print("Xâu rỗng, cút")
            return []
        }
        let parts = tweetString.components(separatedBy:" ")
        //
        for item in parts {
            if item.count > 50 {
                print("Có chữ dài hơn 50 kí tự")
                return []
            }
        }
        //
        var maxLength = 50 - 4
        while true {
            var result = combineMessages(parts, withMaximumLength: maxLength)
            if result.1 {
                return result.0
            } else {
                maxLength = maxLength - 1
            }
        }
    }
    
    static func combineMessages(_ msgs:[String], withMaximumLength length: Int) -> ([String], Bool){
        var sentence: String = msgs.first!
        var results: [String] = []
        var numberSubTweet = 1
        var maximumSubTweetLength = 0
        for index in 1..<(msgs.count) {
            let msg  = msgs[index]
            if (sentence.count + msg.count + 1) <= length {
                sentence = "\(sentence) \(msg)"
            } else {
                numberSubTweet = numberSubTweet + 1
                maximumSubTweetLength = maximumSubTweetLength > sentence.count ? maximumSubTweetLength : sentence.count
                results.append(sentence)
                sentence = msg
            }
        }
        if sentence != msgs.last! {
            results.append(sentence)
        }
        if numberSubTweet == 1 {
            // Bằng 1 thì không cần thêm indicator
            return (results, true)
        }
        let maxIndicatorLength = (numberSubTweet / 10 + 1) * 2 + 2
        let indicatorLength = 50 - length
        if maxIndicatorLength > indicatorLength {
            return ([], false)
        } else {
            for (i, sentence) in results.enumerated() {
                results[i] = "\(i+1)/\(numberSubTweet) \(sentence)"
            }
            return (results, true)
        }
    }
}
