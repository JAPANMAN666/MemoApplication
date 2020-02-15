//
//  DateFormatterController.swift
//  MemoApplication
//
//  Created by HIROYOSHI KOBAYASHI on 2020/02/15.
//  Copyright © 2020 JAPANMAN. All rights reserved.
//

import Foundation
import UIKit

/// DateFormatterを扱うクラス
/// 日本時間のみを対象とする
public class DateFormatterController {
    var dateFormatter = (UIApplication.shared.delegate as! AppDelegate).dateFormatter!

    init(
        timeStyle: DateFormatter.Style = .medium,
        dateStyle: DateFormatter.Style = .short
    ) {
        let locale: Locale = Locale(identifier: "ja_JP")

        dateFormatter.timeStyle = timeStyle
        dateFormatter.dateStyle = dateStyle
        dateFormatter.locale = locale
    }
    
    /// 現在の日付と時刻を、DateFormatterのスタイルに設定した形式の文字列で返す
    public func date(timeStyle: DateFormatter.Style = .medium, dateStyle: DateFormatter.Style = .short) -> String {
        dateFormatter.timeStyle = timeStyle
        dateFormatter.dateStyle = dateStyle
        return dateFormatter.string(from: Date())
    }
    /// 時刻のみを返す
    public func time(timeStyle: DateFormatter.Style = .medium) -> String {
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = timeStyle
        return dateFormatter.string(from: Date())
    }
    /// 日付のみを返す
    public func day(dateStyle: DateFormatter.Style = .short) -> String {
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = dateStyle
        return dateFormatter.string(from: Date())
    }
}
