//
//  LoadSongedList.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/02.
//

import Foundation
import SQLite3

/// songedListを取得するクラス（継承できるメソッドがあるのでクラスにする）
class LoadHistories {
    var histories: [History] = []
    var historiesByDate: [[History]] = [[]]
    var dateUnique: [Date] = []
    
    func start() {
        // TODO: セット済みであればもう動かないようにしたい
        setHistories()
        setHistoriesByDate()
    }
    
    func setHistories() {
        self.histories = []
    }
    
    func setHistoriesByDate() {
        historiesByDate = []
        dateUnique = []
        for history in self.histories {
            dateUnique.append(history.date)
        }
        dateUnique = Array(Set(dateUnique))
        
        for date in dateUnique {
            var temp: [History] = []
            for history in self.histories {
                if history.date == date {
                    temp.append(history)
                }
            }
            historiesByDate.append(temp)
        }
    }
}

final class MockLoadHistories: LoadHistories {
    static let shared = MockLoadHistories()
            
    override func setHistories() {
        self.histories = [
            History(date: "20201220".dateFromString()!,
                    song: MockLoadSongs.shared.getSongById(id: "1")),
            History(date: "20201220".dateFromString()!,
                    song: MockLoadSongs.shared.getSongById(id: "2")),
            History(date: "20201221".dateFromString()!,
                    song: MockLoadSongs.shared.getSongById(id: "3")),
            History(date: "20201221".dateFromString()!,
                    song: MockLoadSongs.shared.getSongById(id: "4")),
            History(date: "20201221".dateFromString()!,
                    song: MockLoadSongs.shared.getSongById(id: "5")),
        ]
    }
}
