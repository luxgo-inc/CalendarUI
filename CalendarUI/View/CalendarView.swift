//
//  CalendarView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/26.
//

import SwiftUI

public struct CalendarView: View {
    @State private var events: [Event]
    
    private let displayType: DisplayType

    public init(type: DisplayType, events: [Event]) {
        self.displayType = type
        self.events = events
    }

    public var body: some View {
        switch(displayType) {
        case .month: MonthView()
        case .week:
            WeekView(week: .init(days: [
                Day(dd: "5", dayOf: "日", events: events),
                Day(dd: "6", dayOf: "月", events: events),
                Day(dd: "7", dayOf: "火", events: events),
                Day(dd: "8", dayOf: "水", events: events),
                Day(dd: "9", dayOf: "木", events: events),
                Day(dd: "10", dayOf: "金", events: events),
                Day(dd: "11", dayOf: "土", events: events)
            ]))
        case .day: DayView(day: .init(dd: "12", dayOf: "水", events: events))
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        let calendar = Calendar(identifier: .gregorian)
        
        /// 2022/12/10 9:30 〜 10:30 の日時を生成
        let event1StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 9, minute: 30, second: 0))!
        let event1EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 30, second: 0))!
        let event1: Event = .init(title: "イベント1", startTime: event1StartTime, endTime: event1EndTime, allDay: false)

        /// 2022/12/10 10:00 〜 10:30 の日時を生成
        let event2StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 0, second: 0))!
        let event2EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 12, minute: 30, second: 0))!
        let event2: Event = .init(title: "イベント2", startTime: event2StartTime, endTime: event2EndTime, allDay: false)
        
        /// 2022/12/10 10:00 〜 11:00 の日時を生成
        let event3StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 16, minute: 0, second: 0))!
        let event3EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 17, minute: 0, second: 0))!
        let event3: Event = .init(title: "イベント3", startTime: event3StartTime, endTime: event3EndTime, allDay: false)
        
        /// 2022/12/10 10:30 〜 12:00 の日時を生成
        let event4StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 19, minute: 30, second: 0))!
        let event4EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 21, minute: 0, second: 0))!
        let event4: Event = .init(title: "イベント4", startTime: event4StartTime, endTime: event4EndTime, allDay: false)
        
        
        Group {
            CalendarView(type: .month, events: [event1, event2, event3, event4])
                .previewDisplayName("month calendar")
            CalendarView(type: .week, events: [event1, event2, event3, event4])
                .previewDisplayName("week calendar")
            CalendarView(type: .day, events: [event1, event2, event3, event4])
                .previewDisplayName("day calendar")
        }
    }
}
