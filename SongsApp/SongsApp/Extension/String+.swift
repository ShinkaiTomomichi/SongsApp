//
//  String+.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/03.
//

import Foundation

extension String {
    func dateFromString(format: String = "yyyyMMdd") -> Date? {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: self)
    }    
}
