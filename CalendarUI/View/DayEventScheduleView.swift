//
//  DayEventScheduleView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/12/10.
//

import SwiftUI

struct DayEventScheduleView: View {
    var events: [Event]
    
    init(events: [Event]) {
        self.events = events
        
        checkConflictEvent()
    }
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(events) { event in
                VStack {
                    Text(event.id)
                    Text(event.title)
                    Text("conflict events: \(event.conflictEvents.count)")
                }
            }
        }
    }
    
    private mutating func checkConflictEvent() {
        for var (idx, event) in events.enumerated() {
            self.events[idx].conflictEvents = events.filter { $0 != event && event.isConflict(targetEvent: $0) }
        }
    }
}

struct DayEventScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        let calendar = Calendar(identifier: .japanese)
        /// 2022/12/10 9:30 〜 10:30 の日時を生成
        let event1StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 9, minute: 30, second: 0))!
        let event1EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 30, second: 0))!
        let event1: Event = .init(title: "イベント1aaa", startTime: event1StartTime, endTime: event1EndTime, allDay: false)
        
        /// 2022/12/10 10:00 〜 10:30 の日時を生成
        let event2StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 0, second: 0))!
        let event2EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 30, second: 0))!
        let event2: Event = .init(title: "イベント2", startTime: event2StartTime, endTime: event2EndTime, allDay: false)
        
        /// 2022/12/10 10:00 〜 11:00 の日時を生成
        let event3StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 0, second: 0))!
        let event3EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 11, minute: 0, second: 0))!
        let event3: Event = .init(title: "イベント3", startTime: event3StartTime, endTime: event3EndTime, allDay: false)
        
        /// 2022/12/10 10:30 〜 12:00 の日時を生成
        let event4StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 30, second: 0))!
        let event4EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 12, minute: 0, second: 0))!
        let event4: Event = .init(title: "イベント4", startTime: event4StartTime, endTime: event4EndTime, allDay: false)
        
        return DayEventScheduleView(events: [event1, event2, event3, event4])
    }
}
