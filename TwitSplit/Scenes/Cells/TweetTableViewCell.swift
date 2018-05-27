//
//  TweetTableViewCell.swift
//  TwitSplit
//
//  Created by Ta-Cuong Nguyen on 5/27/18.
//  Copyright © 2018 Ta-Cuong Nguyen. All rights reserved.
//

import UIKit
import SnapKit

class TweetTableViewCell: UITableViewCell {
    lazy var tweetLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func commonInit() {
        self.addSubview(tweetLabel)
        self.tweetLabel.font = UIFont.systemFont(ofSize: 15)
        self.tweetLabel.textColor = .black
        
        self.tweetLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(16)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).offset(-16)
            make.bottom.equalTo(self).offset(-16)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
