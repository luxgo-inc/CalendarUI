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
        case .month: MonthView()
        case .week: WeekView()
        case .day: DayView()
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
