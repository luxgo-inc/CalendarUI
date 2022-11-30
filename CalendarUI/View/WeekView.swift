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
        Grid(alignment: .center, horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow {
                // TODO: 今日の曜日はハイライト
                // ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]) {
                Spacer()
                ForEach(week.days, id: \.self) { day in
                    VStack {
                        Text(day.dayOf)
                            .font(.subheadline)
                            .foregroundColor(Color(.white))

                        Text(day.dd)
                            .font(.subheadline)
                            .foregroundColor(Color(.white))
                    }
                    .foregroundColor(Color(.darkGray))
                }
            }

            GridRow {
                ScheduleTimeView()
                ForEach(0..<7) { _ in
                    ZStack(alignment: .topLeading) {
                        VStack(alignment: .center, spacing: 1) {
                            ForEach(0..<24) { _ in
                                Rectangle()
                                    .foregroundColor(Color(.darkGray))
                            }
                        }

                        EventView(event: .init(title: "レッスンの予定", date: Date(), allDay: false))
                            .frame(maxWidth: .infinity)
                    } }
                .ignoresSafeArea(edges: [.bottom])
            }
            .background(Color(.gray))
        }
        .background(Color(.gray))
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView(week: .init(days: [
            Day(dd: "5", dayOf: "日"),
            Day(dd: "6", dayOf: "月"),
            Day(dd: "7", dayOf: "火"),
            Day(dd: "8", dayOf: "水"),
            Day(dd: "9", dayOf: "木"),
            Day(dd: "10", dayOf: "金"),
            Day(dd: "11", dayOf: "土")
        ]))
    }
}
