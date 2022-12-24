//
//  MonthView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/30.
//

import SwiftUI

struct MonthView: View {
    @ObservedObject var viewModel: MonthViewModel

    init(viewModel: MonthViewModel) {
        self.viewModel = viewModel
    }
   
    // TODO: GridRowは常に6行、7列
    var body: some View {
        Grid(alignment: .center, horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow {
                // TODO: 今日の曜日はハイライト
                // ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]) {
                ForEach(["日", "月", "火", "水", "木", "金", "土"], id: \.self) {
                    DayOfView(dayof: $0)
                        .padding(.bottom, 4)
                }
            }
            
            weekdayRow(days: viewModel.week1)
            weekdayRow(days: viewModel.week2)
            weekdayRow(days: viewModel.week3)
            weekdayRow(days: viewModel.week4)
            weekdayRow(days: viewModel.week5)
            if !viewModel.week6.isEmpty {
                weekdayRow(days: viewModel.week6)
            }
        }
        .background(Color(.gray))
    }
    
    private func weekdayRow(days: [Day]) -> some View {
            GridRow {
                ForEach(days) { day in
                    VStack(spacing: 1.5) {
                        DateView(date: day.dd)
                        
                        if day.events.isEmpty {
                            Spacer()
                        } else {
                            ForEach(day.events, id: \.self) { event in
                                EventView(event: event, width: .infinity, height: 20)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 4)
                    .padding(.bottom, 1)
                }
            }
            .background(Color(.darkGray))
    }
}

struct MonthView_Previews: PreviewProvider {
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
        
//        let day1: Day = .init(dd: "12", dayOf: "水", events: [event1, event2, event3, event4])
        let day1: Day = .init(date: .now, events: [event1, event2, event3, event4])
        
//        MonthView(viewModel: .init(month: .init(target: "11", days: [day1])))
        MonthView(viewModel: .init(month: .init(target: .now, days: [day1])))
    }
}
