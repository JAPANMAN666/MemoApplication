//
//  AddNewMemoViewController.swift
//  MemoApplication
//
//  Created by HIROYOSHI KOBAYASHI on 2020/01/25.
//  Copyright © 2020 JAPANMAN. All rights reserved.
//

import UIKit

class AddNewMemoViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet private weak var textView: UITextView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if !textView.text.isEmpty {
            saveItem()
        }
    }
    // アイテムを保存する処理
    private func saveItem() {
        if let coreDataController = (UIApplication.shared.delegate as! AppDelegate).coreDataController {
            let context = coreDataController.persistentContainer.viewContext
            let item = MemoItem(context: context)
            item.text = textView.attributedText
            coreDataController.saveContext()
        }
    }
}
