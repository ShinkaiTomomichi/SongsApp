//
//  Date+.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/04.
//

import Foundation

extension Date {
    func stringFromDate(format: String = "yyyyMMdd") -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
