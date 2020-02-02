//
//  MemoContainerModel.swift
//  MemoApplication
//
//  Created by HIROYOSHI KOBAYASHI on 2020/01/25.
//  Copyright © 2020 JAPANMAN. All rights reserved.
//

import Foundation

/// メモ内容を格納するためのモデルを作成
struct MemoContainerModel {
    var memoItems: [NSAttributedString] = []
    
    init() {
        memoItems = Mock.items
    }
}

/// モック
struct Mock {
    static var items = [
        NSAttributedString(string: "Title1"),
        NSAttributedString(string: "Title2"),
        NSAttributedString(string: "Title3"),
        NSAttributedString(string: "Title4"),
        NSAttributedString(string: "Title5")
    ]
}
