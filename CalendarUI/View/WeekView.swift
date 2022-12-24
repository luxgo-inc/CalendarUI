//
//  WeekView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/30.
//

import SwiftUI

struct WeekView: View {
    @State private var week: Week

    init(week: Week) {
        self.week = week
    }

    var body: some View {
        VStack(alignment: .leading) {
            SettingHeaderView(baseDate: .now)
                .padding(.leading, 16)
            
            Grid(alignment: .center, horizontalSpacing: 1, verticalSpacing: 1) {
                GridRow {
                    // TODO: 今日の曜日はハイライト
                    // ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]) {
                    Spacer()
                    ForEach(week.days, id: \.self) { day in
                        VStack(spacing: 2) {
                            DayOfView(dayof: day.dayOf)
                            DateView(date: day.dd)
                        }
                        .foregroundColor(Color(.darkGray))
                    }
                }

                GridRow {
                    ScheduleTimeView()
                    ForEach(week.days, id: \.self) { day in
                        ZStack(alignment: .topLeading) {
                            VStack(alignment: .center, spacing: 1) {
                                ForEach(0..<24) { _ in
                                    Rectangle()
                                        .foregroundColor(Color(.darkGray))
                                }
                            }
                            
                            DayEventScheduleView(events: day.events)
                        } }
                    .ignoresSafeArea(edges: [.bottom])
                }
                .background(Color(.gray))
            }
        }
        .background(Color(.gray))
    }
}

struct WeekView_Previews: PreviewProvider {
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
        
        WeekView(week: .init(days: [
            Day(date: .now, events: [event1, event2, event3, event4]),
            Day(date: .now, events: [event1, event2, event3, event4]),
            Day(date: .now, events: [event1, event2, event3, event4]),
            Day(date: .now, events: [event1, event2, event3, event4]),
            Day(date: .now, events: [event1, event2, event3, event4]),
            Day(date: .now, events: [event1, event2, event3, event4]),
            Day(date: .now, events: [event1, event2, event3, event4])
//            Day(dd: "5", dayOf: "日", events: [event1, event2, event3, event4]),
//            Day(dd: "6", dayOf: "月", events: [event1, event2, event3, event4]),
//            Day(dd: "7", dayOf: "火", events: [event1, event2, event3, event4]),
//            Day(dd: "8", dayOf: "水", events: [event1, event2, event3, event4]),
//            Day(dd: "9", dayOf: "木", events: [event1, event2, event3, event4]),
//            Day(dd: "10", dayOf: "金", events: [event1, event2, event3, event4]),
//            Day(dd: "11", dayOf: "土", events: [event1, event2, event3, event4])
        ]))
    }
}
