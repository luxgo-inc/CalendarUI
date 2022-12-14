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
        ZStack(alignment: .leading) {
            GeometryReader { geometry in
                ForEach(events) { event in
                    EventView(event: event,
                              width: geometry.size.width,
                              height: geometry.size.height / 24 * event.scheduledTime)
                    .offset(x: 0, y: event.positionY * geometry.size.height)
                    .padding(.horizontal, 2)
                }
            }
        }
    }
    
    private mutating func checkConflictEvent() {
        for (idx, event) in events.enumerated() {
            self.events[idx].conflictEvents = events.filter { $0 != event && event.isConflict(targetEvent: $0) }
        }
    }
}

struct DayEventScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        let calendar = Calendar(identifier: .gregorian)
        
        /// 2022/12/10 9:30 〜 10:30 の日時を生成
        let event1StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 9, minute: 30, second: 0))!
        let event1EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 30, second: 0))!
        let event1: Event = .init(title: "イベント1", startTime: event1StartTime, endTime: event1EndTime, allDay: false)

        /// 2022/12/10 10:00 〜 12:30 の日時を生成
        let event2StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 0, second: 0))!
        let event2EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 12, minute: 30, second: 0))!
        let event2: Event = .init(title: "イベント2", startTime: event2StartTime, endTime: event2EndTime, allDay: false)
        
        /// 2022/12/10 16:00 〜 17:00 の日時を生成
        let event3StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 16, minute: 0, second: 0))!
        let event3EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 17, minute: 0, second: 0))!
        let event3: Event = .init(title: "イベント3", startTime: event3StartTime, endTime: event3EndTime, allDay: false)
        
        /// 2022/12/10 19:30 〜 21:00 の日時を生成
        let event4StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 19, minute: 30, second: 0))!
        let event4EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 21, minute: 0, second: 0))!
        let event4: Event = .init(title: "イベント4", startTime: event4StartTime, endTime: event4EndTime, allDay: false)
        return DayEventScheduleView(events: [event1, event2, event3, event4])
    }
}
