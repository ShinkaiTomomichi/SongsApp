//
//  Song.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/02.
//

import Foundation

class Song {
    var date: Date?
    var title: String?
    var artist: String?
    var cover: String?
    var key: Int?
    var imageURL: String?
    var linkURL: String?
    
    /// 楽曲情報を作成するためのイニシャライザ
    /// - Parameters:
    ///   - date: 歌った日付
    ///   - title: 曲のタイトル
    ///   - artist: アーティスト
    ///   - cover
    ///   - key: どのキーで歌ったか
    init(date: Date,
         title: String,
         artist: String? = nil,
         cover: String? = nil,
         key: Int? = nil,
         imageURL: String? = nil,
         linkURL: String? = nil) {
        self.date = date
        self.title = title
        self.artist = artist
        self.cover = cover
        self.key = key
        self.imageURL = imageURL
        self.linkURL = linkURL
    }
    
    // URLSessionを利用して画像データを取得する
    func getImage() {
        
    }
}
