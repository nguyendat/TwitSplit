//
//  TwitSplitTests.swift
//  TwitSplitTests
//
//  Created by Ta-Cuong Nguyen on 5/22/18.
//  Copyright © 2018 Ta-Cuong Nguyen. All rights reserved.
//

import XCTest
@testable import TwitSplit

class TwitSplitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTwitMessageMoreThanLimitCharactersWithNoSpace() {
        let inputString = "Loremipsumdolorsiterelitlamet,consectetaurcilliumadipisicingpecuLoremipsumdolorsiterelitlamet,consectetaurcilliumadipisicingpecu"
        let expectResult = [String]()
        let output = TweetSplitAlgorithm.splitMessage(inputString)
        XCTAssertEqual(output, expectResult)
    }
    
    func testTwitMessageWithSplit() {
        let inputString = "I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself."
        let expectResult = ["1/2 I can't believe Tweeter now supports chunking",
                            "2/2 my messages, so I don't have to do it myself."]
        let output = TweetSplitAlgorithm.splitMessage(inputString)
        XCTAssertEqual(output, expectResult)
    }
    
    func testTwitMessageCanNotSpitWithMoreThanLimitCharacters() {
        let inputString = "Loremipsumdolorsiterelitlamet,consectetaurcilliumadipisicingpecu,sed doeiusmodtemporincididuntutlaboreetdoloremagnaaliqua.Utenimadminimveniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        let expectResult = [String]()
        let output = TweetSplitAlgorithm.splitMessage(inputString)
        XCTAssertEqual(output, expectResult)
    }
    
    func testUserTwitMessageLessThanLimitCharacters() {
        let inputString = "Loremipsumdolorsiterelitlamet,consectetaurcilli sed doeiusmodtemporincididuntutlaboreetdo. Utenimadminimveniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"
        let expectResult = ["1/4 Loremipsumdolorsiterelitlamet,consectetaurcilli",
                            "2/4 sed doeiusmodtemporincididuntutlaboreetdo.",
                            "3/4 Utenimadminimveniam,quis nostrud exercitation",
                            "4/4 ullamco laboris nisi ut aliquip ex ea commodo"]
        let outputResult = TweetSplitAlgorithm.splitMessage(inputString)
        XCTAssertEqual(outputResult, expectResult)
    }
    
    func testWithMessageHasOnlySpace() {
        let inputString = "I can'tbelieveTweeternowsupportschunkingmymessages,soIdon'thavetodoitmyself"
        let expectResult = [String]()
        let output = TweetSplitAlgorithm.splitMessage(inputString)
        XCTAssertEqual(output, expectResult)
    }
    
    func testTweetWithTenSpace() {
        let inputString = "                                                       "
        let expectResult = [String]()
        let output = TweetSplitAlgorithm.splitMessage(inputString);
        XCTAssertEqual(output, expectResult)
    }
    
    func testTweetLessThan10Chunks() {
        
    }
    
    func testTweetMoreThan10Chunks() {
        let inputString = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        let expectResult = ["1/27 Lorem ipsum dolor sit er elit lamet,",
                            "2/27 consectetaur cillium adipisicing pecu, sed",
                            "3/27 do eiusmod tempor incididunt ut labore et",
                            "4/27 dolore magna aliqua. Ut enim ad minim",
                            "5/27 veniam, quis nostrud exercitation ullamco",
                            "6/27 laboris nisi ut aliquip ex ea commodo",
                            "7/27 consequat. Duis aute irure dolor in",
                            "8/27 reprehenderit in voluptate velit esse",
                            "9/27 cillum dolore eu fugiat nulla pariatur.",
                            "10/27 Excepteur sint occaecat cupidatat non",
                            "11/27 proident, sunt in culpa qui officia",
                            "12/27 deserunt mollit anim id est laborum. Nam",
                            "13/27 liber te conscient to factor tum poen",
                            "14/27 legum odioque civiuda. Lorem ipsum dolor",
                            "15/27 sit er elit lamet, consectetaur cillium",
                            "16/27 adipisicing pecu, sed do eiusmod tempor",
                            "17/27 incididunt ut labore et dolore magna",
                            "18/27 aliqua. Ut enim ad minim veniam, quis",
                            "19/27 nostrud exercitation ullamco laboris nisi",
                            "20/27 ut aliquip ex ea commodo consequat. Duis",
                            "21/27 aute irure dolor in reprehenderit in",
                            "22/27 voluptate velit esse cillum dolore eu",
                            "23/27 fugiat nulla pariatur. Excepteur sint",
                            "24/27 occaecat cupidatat non proident, sunt in",
                            "25/27 culpa qui officia deserunt mollit anim id",
                            "26/27 est laborum. Nam liber te conscient to",
                            "27/27 factor tum poen legum odioque civiuda."]
        let output = TweetSplitAlgorithm.splitMessage(inputString)
        XCTAssertEqual(output, expectResult)
    }
    
    func testTweetWithHTMLCharacterLessThan10Chunks() {
        let inputString = "<h1>Lorem ipsum dolor sit er elit lamet</h1> consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt <hr>ut labore et dolore magna</hr> aliqua. Ut enim ad minim <br>veniam, quis nostrud exercitation</br> ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in <p>reprehenderit in voluptate velit esse cillum dolore</p> eu fugiat nulla pariatur"
        let expectResult = ["1/9 <h1>Lorem ipsum dolor sit er elit lamet</h1>",
                            "2/9 consectetaur cillium adipisicing pecu, sed do",
                            "3/9 eiusmod tempor incididunt <hr>ut labore et",
                            "4/9 dolore magna</hr> aliqua. Ut enim ad minim",
                            "5/9 <br>veniam, quis nostrud exercitation</br>",
                            "6/9 ullamco laboris nisi ut aliquip ex ea commodo",
                            "7/9 consequat. Duis aute irure dolor in",
                            "8/9 <p>reprehenderit in voluptate velit esse",
                            "9/9 cillum dolore</p> eu fugiat nulla pariatur"]
        let output = TweetSplitAlgorithm.splitMessage(inputString)
        XCTAssertEqual(output, expectResult)
    }
    
    func testTweetWithSpecialCharacter() {
        let inputString = "@#$&@)$& Lorem ipsum dolor sit er elit lamet, consectetaur $((&_!#!#$2"
        let expectResult = ["1/2 @#$&@)$& Lorem ipsum dolor sit er elit lamet,",
                            "2/2 consectetaur $((&_!#!#$2"]
        let output = TweetSplitAlgorithm.splitMessage(inputString)
        XCTAssertEqual(output, expectResult)
    }
    
    func testTweetHasUnicodeCharacter() {
        let inputString = "🤓🤓🤓🤓🤓🤓 😜😜😜😜😜 Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu"
        let expectResult = ["1/2 🤓🤓🤓🤓🤓🤓 😜😜😜😜😜 Lorem ipsum dolor sit er elit",
                            "2/2 lamet, consectetaur cillium adipisicing pecu"]
        let output = TweetSplitAlgorithm.splitMessage(inputString)
        XCTAssertEqual(output, expectResult)
    }
}
