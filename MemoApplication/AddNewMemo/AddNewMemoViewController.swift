//
//  AddNewMemoViewController.swift
//  MemoApplication
//
//  Created by HIROYOSHI KOBAYASHI on 2020/01/25.
//  Copyright © 2020 JAPANMAN. All rights reserved.
//

import UIKit

class AddNewMemoViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet private weak var editTextView: UITextView!
    @IBOutlet weak var doneButton: UIBarButtonItem!

    override public func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if !editTextView.text.isEmpty {
            saveItem()
        }
    }
    // アイテムを保存する処理
    private func saveItem() {
        if let coreDataController = (UIApplication.shared.delegate as! AppDelegate).coreDataController {
            let context = coreDataController.persistentContainer.viewContext
            let item = MemoItem(context: context)
            item.text = editTextView.attributedText
            coreDataController.saveContext()
        }
    }

    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        /// キーボードを隠して編集を終了する
        editTextView.resignFirstResponder()
    }
}

extension AddNewMemoViewController: UITextViewDelegate {
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
