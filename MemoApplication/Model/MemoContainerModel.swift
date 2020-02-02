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
    var memoItems: [String] = []
    
    init() {
        memoItems = Mock.items
    }
}

/// モック
struct Mock {
    static var items = [
        "Title1",
        "Title2",
        "Title3",
        "Title4",
        "Title5"
    ]
}
