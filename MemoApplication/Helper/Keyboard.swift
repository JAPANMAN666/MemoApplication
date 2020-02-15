//
//  Keyboard.swift
//  MemoApplication
//
//  Created by HIROYOSHI KOBAYASHI on 2020/02/15.
//  Copyright © 2020 JAPANMAN. All rights reserved.
//

import Foundation
import UIKit

/// 閉じるボタン付きのキーボードを作成する時に使用する
public class DoneTextField: UITextView {
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configureDoneTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureDoneTextField()
    }
    
    private func configureDoneTextField(){
        /// Doneボタン用のツールバーを作成
        let tools = UIToolbar()
        tools.frame = CGRect(x: 0, y: 0, width: frame.width, height: 40)
        /// ツールバーのアイテムとしてく空白部分とDoneボタンを作成
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let closeButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.closeButtonTapped))
        tools.items = [spacer, closeButton]
        /// ソフトウェアキーボードの上につける
        inputAccessoryView = tools
    }

    /// Doneボタンが押された時のアクション
    @objc func closeButtonTapped(){
        endEditing(true)
        resignFirstResponder()
    }
}
