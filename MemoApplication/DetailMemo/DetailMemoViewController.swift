//
//  EditMemoTableViewController.swift
//  MemoApplication
//
//  Created by HIROYOSHI KOBAYASHI on 2020/01/25.
//  Copyright © 2020 JAPANMAN. All rights reserved.
//

import UIKit
import Foundation

class DetailMemoViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet private weak var editTextView: UITextView!
    
    private var bodyText: NSAttributedString = NSAttributedString()
    
    /// タップしたセルのアイテム格納用
    private var item: MemoItem = MemoItem()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        
        editTextView.attributedText = bodyText
    }
    
    
    
    /// タップしたセルの中身を引っ張ってきて格納。
    public func setItemToDetailMemo(item: MemoItem) {
        self.item = item
        
        if let bodyText = item.text {
            self.bodyText = bodyText
        } else {
            print("中身を引っ張り出せません")
        }
    }
}

// NavigationController処理系
extension DetailMemoViewController {
    /// 戻るボタンを押した時の処理を記述する。
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // TODO: - テキストビューが空である時は警告を出すようにする。

        /// 遷移する先によって処理を変える。
        switch viewController {
        /// トップに遷移する場合
        case is TopMemoListViewController:
            // 中身をデータに上書きする
            item.text = editTextView.attributedText
            
        default:
            break
        }
    }
}
