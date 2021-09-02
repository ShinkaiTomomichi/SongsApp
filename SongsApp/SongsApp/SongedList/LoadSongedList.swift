//
//  LoadSongedList.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/02.
//

import Foundation

/// songedListを取得するクラスのプロトコル
protocol LoadSongedList {
    func getSongedList() -> [Song]
}

final class MockLoadSongedList: LoadSongedList {
    func getSongedList() -> [Song] {
        let songedList = [
            Song(date: Date(), title: "NEXT COLOR PLANET", artist: "星街すいせい", imageURL: "https://i.ytimg.com/vi/vQHVGXdcqEQ/hqdefault.jpg", linkURL: "https://www.youtube.com/watch?v=vQHVGXdcqEQ"),
            Song(date: Date(), title: "グッバイ宣言", artist: "Chinozo", cover: "百鬼あやめ", imageURL: "https://i.ytimg.com/vi/z1W4c7ym49Y/hqdefault.jpg", linkURL: "https://www.youtube.com/watch?v=z1W4c7ym49Y"),
            Song(date: Date(), title: "-ERROR", artist: "niki", cover: "常闇トワ", imageURL: "https://i.ytimg.com/vi/3UV8OZj2olg/hqdefault.jpg", linkURL: "https://www.youtube.com/watch?v=3UV8OZj2olg"),
            Song(date: Date(), title: "チューリングラブ", artist: "Sou/ナナヲアカリ", cover: "湊あくあ/猫又おかゆ", imageURL: "https://i.ytimg.com/vi/0OtNQEpSeIA/hqdefault.jpg", linkURL: "https://www.youtube.com/watch?v=0OtNQEpSeIA"),
            Song(date: Date(), title: "エンヴィーベイビー", artist: "Kanaria", cover: "尾丸ポルカ", imageURL: "https://i.ytimg.com/vi/UpoysjZfWrU/hqdefault.jpg", linkURL: "https://www.youtube.com/watch?v=UpoysjZfWrU"),
        ]
        return songedList
    }
}
