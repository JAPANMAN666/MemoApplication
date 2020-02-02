//
//  EditMemoTableViewController.swift
//  MemoApplication
//
//  Created by HIROYOSHI KOBAYASHI on 2020/01/25.
//  Copyright © 2020 JAPANMAN. All rights reserved.
//

import UIKit

class DetailMemoViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet private weak var editTextView: UITextView!

    override public func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
    }
    
    /// タップしたセルの中身を引っ張ってくる。
    public func setItemToTextView(path: IndexPath) {
        
    }
}

extension DetailMemoViewController {
    /// 戻るボタンを押した時の処理を記述する。
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        switch viewController {
        case is TopMemoListViewController:
            print(viewController)

            // TODO:  空だったら削除して、空じゃなければその中身をデータに上書きする
            if editTextView.text.isEmpty ||
                editTextView.text == nil {
                print("Empty")
                break
            } else {
                print(editTextView.text!)
            }
            
        default:
            break
        }
    }
}
