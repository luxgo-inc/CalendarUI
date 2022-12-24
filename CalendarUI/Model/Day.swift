//
//  Day.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/30.
//

import Foundation

struct Day: Hashable, Identifiable {
    var id: String {
        if let date {
            return dd + dayOf + "\(date.timeIntervalSince1970)"
        } else {
            return UUID().uuidString
        }
    }

    let dd: String
    let dayOf: String
    let date: Date?
    let events: [Event]

    var current: Bool = false
    private let weekdays = ["日", "月", "火", "水", "木", "金", "土"]
    
    init(date: Date?, events: [Event]) {
        self.date = date
        let calendar = Calendar(identifier: .gregorian)
        if let date {
            self.dd = String(calendar.component(.day, from: date))
            self.dayOf = weekdays[calendar.component(.weekday, from: date)-1]
        } else {
            self.dd = ""
            self.dayOf = ""
        }
        self.events = events
    }
    
    static func makeEmpty() -> Self {
        .init(date: nil, events: [])
    }
}
