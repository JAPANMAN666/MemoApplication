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
    
    /// 戻るボタンを押した時の処理を記述する。
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let coreDataController = (UIApplication.shared.delegate as! AppDelegate).coreDataController {
            let context = coreDataController.persistentContainer.viewContext
            
            switch viewController {
            // TODO:  空だったら保存しないで、中身がある場合は配列に追加してセルを生成する処理を挿入
            case is TopMemoListViewController:
                if (!textView.text.isEmpty) {
                    let item = MemoItem(context: context)
                    item.text = textView.attributedText
                    coreDataController.saveContext()
                }

            default:
                break
            }
        }
    }
}
