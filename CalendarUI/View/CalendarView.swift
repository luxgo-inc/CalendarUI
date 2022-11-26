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
                }
            }
            GridRow {
                // TODO: 現在の月の1日の曜日から逆算して空白を入れる
                ForEach(0..<7) { _ in Color.red }
            }
            GridRow {
                ForEach(0..<7) { _ in Color.green }
            }
            GridRow {
                ForEach(0..<7) { _ in Color.blue }
            }
            GridRow {
                ForEach(0..<7) { _ in Color.red }
            }
            GridRow {
                ForEach(0..<7) { _ in Color.green }
            }
            GridRow {
                // TODO: 現在の月の末尾の曜日から逆算して空白を入れる
                ForEach(0..<7) { _ in Color.blue }
            }
        }
    }

    private var weekView: some View {
        Grid(alignment: .center, horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow {
                // TODO: 今日の曜日はハイライト
                // ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]) {
                ForEach(["日", "月", "火", "水", "木", "金", "土"], id: \.self) { dayOf in
                    VStack {
                        Text(dayOf)
                        Text("12")
                    }
                }
            }
            GridRow {
                scheduleTime
                ForEach(0..<7) { _ in Color.red }
            }
        }
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
                ForEach(0..<1) { _ in Color.red }
            }
        }
    }

    private var scheduleTime: some View {
        VStack {
            ForEach(0..<23) {
                Text("\($0):00")
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalendarView(type: .month)
            CalendarView(type: .week)
            CalendarView(type: .day)
        }
    }
}
