//
//  ViewController.swift
//  MemoApplication
//
//  Created by HIROYOSHI KOBAYASHI on 2020/01/25.
//  Copyright © 2020 JAPANMAN. All rights reserved.
//

import UIKit
import CoreData

class TopMemoListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    /// モデルのインスタンスを作成
    var memoContainerModel: MemoContainerModel = MemoContainerModel()
    
    var items: [MemoItem] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        items = (UIApplication.shared.delegate as! AppDelegate).coreDataController.fetchItem()
    
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///左側に編集ボタンを表示する
        navigationItem.leftBarButtonItem = editButtonItem
    }
}

extension TopMemoListViewController {
    @IBAction func addMemoButton(_ sender: UIBarButtonItem) {
        let nextStoryboard = UIStoryboard(name: "AddNewMemo", bundle: nil)
        guard let nextVC = nextStoryboard.instantiateViewController(withIdentifier: "AddNewMemo") as? AddNewMemoViewController else {
            fatalError("Cannot access AddNewMemoViewController. Check TopMemoViewController.swift")
        }

        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension TopMemoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "TopMemoListTableViewCell", for: indexPath
                ) as? TopMemoListTableViewCell else {
            fatalError("Cannot Generate TopMemoListTableViewCell. Check TopMemoListViewController.swift")
        }
        
        if let text = items[indexPath.row].text {
            /// 格納したメモを取り出してタイトルとしてセット
            cell.configure(title: text)
        }
        
        return cell
    }
}

extension TopMemoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let nextStoryboard = UIStoryboard(name: "DetailMemo", bundle: nil)

        if let nextVC = nextStoryboard.instantiateViewController(withIdentifier: "DetailMemo") as? DetailMemoViewController {
            nextVC.setItemToDetailMemo(item: items[indexPath.row])
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if let coreDataController = (UIApplication.shared.delegate as! AppDelegate).coreDataController {
            coreDataController.deleteItem(items[indexPath.row])
            coreDataController.saveContext()
            
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            tableView.reloadData()
        }
    }
    /// Editボタンが押された時削除ボタンを表示させる
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
}
