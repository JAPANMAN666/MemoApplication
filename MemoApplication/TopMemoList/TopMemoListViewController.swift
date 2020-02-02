//
//  ViewController.swift
//  MemoApplication
//
//  Created by HIROYOSHI KOBAYASHI on 2020/01/25.
//  Copyright © 2020 JAPANMAN. All rights reserved.
//

import UIKit

class TopMemoListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    /// モデルのインスタンスを作成
    lazy var memoContainerModel: MemoContainerModel = MemoContainerModel()
}

extension TopMemoListViewController {
    @IBAction func addMemoButton(_ sender: UIBarButtonItem) {
        let nextStoryboard = UIStoryboard(name: "AddNewMemo", bundle: nil)
        
        let nextVC = nextStoryboard.instantiateViewController(withIdentifier: "AddNewMemo")
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension TopMemoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoContainerModel.memoItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "TopMemoListTableViewCell", for: indexPath
                ) as? TopMemoListTableViewCell else {
            fatalError("Cannot Generate TopMemoListTableViewCell. Check TopMemoListViewController.swift")
        }
        
        /// 格納したメモを取り出してタイトルとしてセット
        cell.configure(title: memoContainerModel.memoItems[indexPath.row])
        
        return cell
    }
}

extension TopMemoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let nextStoryboard = UIStoryboard(name: "DetailMemo", bundle: nil)
        if let nextVC = nextStoryboard.instantiateViewController(withIdentifier: "DetailMemo") as? DetailMemoViewController {
            nextVC.setTextToTextView(detailMemoText: memoContainerModel.memoItems[indexPath.row])
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
