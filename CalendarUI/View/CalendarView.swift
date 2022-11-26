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
        case .month: monthView
        case .week: weekView
        case .day: dayView
        }
    }

    private var monthView: some View {
        Grid(alignment: .center, horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow {
                // TODO: 今日の曜日はハイライト
                // ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]) {
                ForEach(["日", "月", "火", "水", "木", "金", "土"], id: \.self) {
                    Text($0)
                        .font(.caption)
                        .foregroundColor(Color(.white))
                        .padding(.bottom, 4)
                }
            }
            GridRow {
                // TODO: 現在の月の1日の曜日から逆算して空白を入れる
                ForEach(0..<7) { _ in
                    VStack {
                        Text("1")
                            .font(.caption)
                            .foregroundColor(Color(.white))
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 4)
                }
            }
            .background(Color(.darkGray))
            
            GridRow {
                ForEach(0..<7) { _ in
                    VStack {
                        Text("8")
                            .font(.caption)
                            .foregroundColor(Color(.white))
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 4)
                }
            }
            .background(Color(.darkGray))
            
            GridRow {
                ForEach(0..<7) { _ in
                    VStack {
                        Text("10")
                            .font(.caption)
                            .foregroundColor(Color(.white))
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 4)
                }
            }
            .background(Color(.darkGray))
            
            GridRow {
                ForEach(0..<7) { _ in
                    VStack {
                        Text("17")
                            .font(.caption)
                            .foregroundColor(Color(.white))
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 4)
                }
            }
            .background(Color(.darkGray))
            
            GridRow {
                ForEach(0..<7) { _ in
                    VStack {
                        Text("23")
                            .font(.caption)
                            .foregroundColor(Color(.white))
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 4)
                }
            }
            .background(Color(.darkGray))
            
            GridRow {
                // TODO: 現在の月の末尾の曜日から逆算して空白を入れる
                ForEach(0..<7) { _ in
                    VStack {
                        Text("30")
                            .font(.caption)
                            .foregroundColor(Color(.white))
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 4)
                }
            }
            .background(Color(.darkGray))
        }
        .background(Color(.gray))
    }

    private var weekView: some View {
        Grid(alignment: .center, horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow {
                // TODO: 今日の曜日はハイライト
                // ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]) {
                Spacer()
                ForEach(["日", "月", "火", "水", "木", "金", "土"], id: \.self) { dayOf in
                    VStack {
                        Text(dayOf)
                        Text("12")
                    }
                }
            }
            GridRow {
                scheduleTime
                ForEach(0..<7) { _ in
                    VStack(alignment: .center, spacing: 1) {
                        ForEach(1..<24) { _ in Color.blue }
                    }
                }
            }
        }
        .padding(.leading, 6)
    }

    private var dayView: some View {
        Grid(alignment: .center, horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow {
                // TODO: 今日の曜日はハイライト
                VStack {
                    Text("水")
                    Text("12")
                }
                Text("予定はありません")

            }
            GridRow {
                scheduleTime
                VStack(alignment: .center, spacing: 1) {
                    ForEach(1..<24) { _ in Color.blue }
                }
            }
        }
        .padding(.leading, 6)
    }

    private var scheduleTime: some View {
        // TODO: set space size
        VStack(alignment: .center, spacing: 1) {
            ForEach(1..<24) { hour in
                VStack {
                    Spacer()
                    Text("\(hour):00")
                        .font(.caption)
                        .padding(.init(top: 0, leading: 2, bottom: -8, trailing: 2))
                }
                .frame(height: .infinity)
            }
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
