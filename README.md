# TwitSplit
![License](https://img.shields.io/cocoapods/l/ResolutionChecker.svg?style=flat)
![](https://img.shields.io/badge/Supported-iOS11.3-4BC51D.svg?style=flat)
![](https://img.shields.io/badge/Swift4-compatible-4BC51D.svg?style=flat)

TwitSplit allow users to post short message limited to 50 characters. 

## Feature
- [x] [Split message](https://github.com/jack3010/TwitSplit#split-message)

## Requirements

- iOS 11.3
- Xcode 9
- Swift 4

## What I've done

- Split Algorithm
- SplitMessage application
- Unit test

## Steps to TwitSplit works

- **Step 1:** Standard input tweet.
```swift
extension String {
    var standardizedWhitespace: String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}
```
- **Step 2:** Check a tweet is empty
```swift
if tweetString.count == 0 {
  return []
}
```
- **Step 3:** Check a tweet has number of characters smaller or equal 50. Return message. 
```swift
if tweetString.count <= length {
  return([tweetString])
}
```
- **Step 4:** Check if a tweet contains a word which has more than 50 characters.
```swift
let parts = tweetString.components(separatedBy:" ")
for item in parts {
    if item.count > 50 {
        return []
    }
}
```
- **Step 5:** Implement `tweetSplitAlgorithm`

Dividing the assuming number of subtweets to different ranges. 
(1-9, 10-99, 100-999...) Why should we do that?
For example, if the number of subtweets is from 1-9, all the indicator is in form of "x/x " which needs 4 characters to present.
If the number of subtweets if from 10-99, the indicators are in form of "x/yy "(5 characters) or "xx/yy " (6 characters).

```swift
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
```

We will run into many ranges until we find the suitable results.
In each range, 
- Create a new sentence with a first word in the tweet.
- We will loop all words in a tweet
    + Calculate the index of the subtweet.
    ```swift
    var numberSubTweet = 1
    ```
    + Calculate the number of characters that the indicators need.
    ```swift
    var maxSubTweetLength = maxTweetLength - lengthOfIndicator(numberSubTweet, andMaxNumberOfSubTweet: maxNumberSubTweet)
    ```
    + Try to append a word into a sentence if there is a space. If not, create a new subtweet and append a proccessing word to subtweet.
    ```swift
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
    ```
    + If the number of subtweets is out of the defined range, we will try to increase the assuming number of subtweets to the next range.
      ```swift
      if numberSubTweet > maxNumberSubTweet {
          return Result(subTweets: [], success: false)
      }
      ```
- Loop to all subtweets, append the indicator and return the result.
     ```swift
    for (i, sentence) in results.enumerated() {
        results[i] = "\(i+1)/\(numberSubTweet) \(sentence)"
    }
    return Result(subTweets:results, success: true)
    ```
## License

TwitSplit is released under the MIT license. See LICENSE for details.
