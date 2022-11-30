//
//  MonthView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/30.
//

import SwiftUI

struct MonthView: View {
    var body: some View {
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
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView()
    }
}
