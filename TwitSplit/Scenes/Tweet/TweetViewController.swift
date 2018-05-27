//
//  TweetViewController.swift
//  TwitSplit
//
//  Created by Ta-Cuong Nguyen on 5/27/18.
//  Copyright © 2018 Ta-Cuong Nguyen. All rights reserved.
//

import UIKit
import SnapKit

class TweetViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView = UITableView()
    var messageArray = [String]()
    
    let cellClass: AnyClass = TweetTableViewCell.self
    var cellIdentifier: String { return String(describing: cellClass) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Posts"
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.bottom.trailing.leading.equalTo(self.view)
        }
        
        self.tableView.register(cellClass, forCellReuseIdentifier: cellIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TweetTableViewCell else {
            return UITableViewCell()
        }
        cell.tweetLabel.text = messageArray[indexPath.row]
        return cell
    }

}
