//
//  DayView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/30.
//

import SwiftUI

struct DayView: View {
    @State private var day: Day

    init(day: Day) {
        self.day = day
    }

    var body: some View {
        Grid(alignment: .center, horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow {
                // TODO: 今日の曜日はハイライト
                VStack {
                    Text(day.dayOf)
                        .font(.subheadline)
                        .foregroundColor(Color(.white))
                    Text(day.dd)
                        .font(.subheadline)
                        .foregroundColor(Color(.white))
                }
                Text("予定はありません")
                    .font(.subheadline)
                    .foregroundColor(Color(.white))

            }
            .background(Color(.gray))

            GridRow {
                ScheduleTimeView()
                VStack(alignment: .center, spacing: 1) {
                    ForEach(1..<24) { _ in
                        Rectangle()
                            .foregroundColor(Color(.darkGray))
                    }
                }
                .ignoresSafeArea(edges: [.bottom])
            }
            .background(Color(.gray))
        }
        .background(Color(.gray))
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(day: .init(dd: "12", dayOf: "水"))
    }
}
