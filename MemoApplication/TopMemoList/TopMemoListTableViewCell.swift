//
//  TopMemoListTableViewCell.swift
//  MemoApplication
//
//  Created by HIROYOSHI KOBAYASHI on 2020/01/25.
//  Copyright © 2020 JAPANMAN. All rights reserved.
//

import UIKit

class TopMemoListTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(title: NSAttributedString) {
        titleLabel.attributedText = title
    }
}
