//
//  Event.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/30.
//

import Foundation

struct Event: Equatable, Identifiable {
    var id: String {
        title + "\(startTime.timeIntervalSince1970)" + "\(endTime.timeIntervalSince1970)"
    }
    
    let title: String
    let startTime: Date
    let endTime: Date
    let allDay: Bool
    
    var conflictEvents: [Event] = []
}

extension Event {
    // イベントの重複におけるロジック
    // start timeにより条件を変更する
    func isConflict(targetEvent: Event) -> Bool {
        // 1. start(base) < start(target) -> end(base) > start(target) == かぶっている
        if startTime < targetEvent.startTime {
            return endTime > targetEvent.startTime
        }
        
        // 2. start(base) > start(target) -> start(base) > end(target) == かぶっている
        if startTime > targetEvent.startTime {
            return startTime < targetEvent.endTime
        }
        
        // 3. start(base) == start(target) -> かぶっている
        return startTime == targetEvent.startTime
    }
}
