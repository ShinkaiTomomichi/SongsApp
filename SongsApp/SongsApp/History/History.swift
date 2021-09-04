//
//  Songed.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/03.
//

import Foundation

// 歌のクラスとは別に履歴のクラスを用意した方が良さそう
class History {
    var date: Date
    var key: Int
    var song: Song?

    /// 楽曲情報を作成するためのイニシャライザ
    /// - Parameters:
    ///   - date: 歌った日付
    ///   - key: どのキーで歌ったか
    ///   - song: 曲
    init(date: Date = Date(),
         key: Int = 0,
         song: Song? = nil) {
        self.date = date
        self.key = key
        self.song = song
    }
}
