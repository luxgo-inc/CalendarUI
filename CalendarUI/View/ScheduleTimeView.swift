//
//  ScheduleTimeView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/30.
//

import SwiftUI

struct ScheduleTimeView: View {
    var body: some View {
        // TODO: set space size
        VStack(alignment: .center, spacing: 1) {
            ForEach(1..<24) { hour in
                VStack {
                    Spacer()
                    Text("\(hour):00")
                        .font(.caption2)
                        .foregroundColor(Color(.white))
                        .padding(.init(top: 0, leading: 2, bottom: -8, trailing: 2))
                }
                .frame(height: .infinity)
            }
        }
        .padding(.leading, 6)
        .background(Color(.darkGray))
    }
}

struct ScheduleTimeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScheduleTimeView()
        }
    }
}
