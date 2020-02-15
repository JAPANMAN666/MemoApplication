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
    @IBOutlet weak var doneButton: UIBarButtonItem!

    private var bodyText: NSAttributedString = NSAttributedString()

    /// タップしたセルのアイテム格納用
    private var item: MemoItem = MemoItem()

    /// 時刻取得用
    private let date = DateFormatterController()

    override public func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self

        editTextView.attributedText = bodyText
        doneButton.isEnabled = false
        doneButton.tintColor = UIColor.clear
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if editTextView.text.isEmpty {
            //TODO: 空であるなら警告を出して削除するかを確認する
        } else {
            item.text = editTextView.attributedText
            item.updatedDate = date.date()
        }

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
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        /// キーボードを隠して編集を終了する
        editTextView.resignFirstResponder()
    }
}

extension DetailMemoViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        /// Doneボタンを有効にする
        doneButton.isEnabled = true
        doneButton.tintColor = UIColor.init(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        /// 編集を終えたらボタンを隠す
        doneButton.isEnabled = false
        doneButton.tintColor = UIColor.clear
    }
}
