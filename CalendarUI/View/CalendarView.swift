//
//  CalendarView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/26.
//

import SwiftUI

public struct CalendarView: View {
    private let displayType: DisplayType

    public init(type: DisplayType) {
        self.displayType = type
    }

    public var body: some View {
        switch(displayType) {
        case .month:
            MonthView()
                .frame(width: .infinity)
        case .week:
            WeekView(week: .init(days: [
                Day(dd: "5", dayOf: "日"),
                Day(dd: "6", dayOf: "月"),
                Day(dd: "7", dayOf: "火"),
                Day(dd: "8", dayOf: "水"),
                Day(dd: "9", dayOf: "木"),
                Day(dd: "10", dayOf: "金"),
                Day(dd: "11", dayOf: "土")
            ]))
        case .day: DayView(day: .init(dd: "12", dayOf: "水"))
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalendarView(type: .month)
                .previewDisplayName("month calendar")
            CalendarView(type: .week)
                .previewDisplayName("week calendar")
            CalendarView(type: .day)
                .previewDisplayName("day calendar")
        }
    }
}
