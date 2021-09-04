//
//  LoadSongs.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/04.
//

import Foundation

// 本来はシングルトンでキャッシュとして持っておくようなものではなさそう
// 都度データベースから引用して、適宜キャッシュを利用するのが良さそう
protocol LoadSongs {
    static var shared: Self { get }
    var songs: [Song] { get }
}

// DB連携するまではMockを利用する
final class MockLoadSongs: LoadSongs {
    static var shared: MockLoadSongs = MockLoadSongs()
    var songs: [Song] = [
        Song(id: "1", title: "NEXT COLOR PLANET", artist: "星街すいせい", cover: nil, videoId: "vQHVGXdcqEQ"),
        Song(id: "2", title: "グッバイ宣言", artist: "Chinozo", cover: "百鬼あやめ", videoId: "z1W4c7ym49Y"),
        Song(id: "3", title: "-ERROR", artist: "niki", cover: "常闇トワ", videoId: "3UV8OZj2olg"),
        Song(id: "4", title: "チューリングラブ", artist: "Sou/ナナヲアカリ", cover: "湊あくあ/猫又おかゆ", videoId: "0OtNQEpSeIA"),
        Song(id: "5", title: "エンヴィーベイビー", artist: "Kanaria", cover: "尾丸ポルカ", videoId: "UpoysjZfWrU"),
    ]
    
    // 辞書型の方が早いか？（しかし結局色んな検索かけるから難しい...）
    // enumで検索タイプも指定できるようにした方が良いか？
    // しかし複数形で取得したい時とそうじゃ無い時があるからな...
    func getSongById(id: String) -> Song? {
        for song in self.songs {
            if song.id == id {
                return song
            }
        }
        return nil
    }
    
    func getSongByTitle(title: String) -> [Song]? {
        for song in self.songs {
            if song.title == title {
                return [song]
            }
        }
        return nil
    }
}
