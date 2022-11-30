//
//  WeekView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/30.
//

import SwiftUI

struct WeekView: View {
    var body: some View {
        Grid(alignment: .center, horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow {
                // TODO: 今日の曜日はハイライト
                // ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]) {
                Spacer()
                ForEach(["日", "月", "火", "水", "木", "金", "土"], id: \.self) { dayOf in
                    VStack {
                        Text(dayOf)
                            .foregroundColor(Color(.white))

                        Text("12")
                            .foregroundColor(Color(.white))
                    }
                    .foregroundColor(Color(.darkGray))
                }
            }

            GridRow {
                ScheduleTimeView()
                ForEach(0..<7) { _ in
                    VStack(alignment: .center, spacing: 1) {
                        ForEach(1..<24) { _ in
                            Rectangle()
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                }
                .ignoresSafeArea(edges: [.bottom])
            }
            .background(Color(.gray))
        }
        .background(Color(.gray))
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
