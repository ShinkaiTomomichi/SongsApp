//
//  Array+.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/05.
//

import Foundation

extension Array {
    func unique(sort: Bool = true) -> Array {
        // TODO: Hashableの時だけ利用できるように修正したい
        return self
        // return Array(Set(self))
    }
}
