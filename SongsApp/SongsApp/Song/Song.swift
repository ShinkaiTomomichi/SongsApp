//
//  Song.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/02.
//

import Foundation

// 歌のクラスとは別に履歴のクラスを用意した方が良さそう
class Song {
    var id: String
    var title: String
    var artist: String?
    var cover: String?
    var videoId: String?
    
    /// 楽曲情報を作成するためのイニシャライザ
    /// - Parameters:
    ///   - id: 曲のID
    ///   - title: 曲のタイトル
    ///   - artist: アーティスト
    ///   - cover: カバーしたアーティスト
    ///   - videoId: YoutubeのビデオID
    init(id: String,
         title: String,
         artist: String? = nil,
         cover: String? = nil,
         videoId: String? = nil) {
        self.id = id
        self.title = title
        self.artist = artist
        self.cover = cover
        self.videoId = videoId
    }
    
    func getYoutubeLink() -> String? {
        if let videoId = self.videoId {
            return "https://www.youtube.com/watch?v=\(videoId)"
        } else {
            return nil
        }
    }
    
    func getThumbnailLink() -> String? {
        if let videoId = self.videoId {
            return "https://i.ytimg.com/vi/\(videoId)/hqdefault.jpg"
        } else {
            return nil
        }
    }
}
