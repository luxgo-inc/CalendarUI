//
//  EventView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/30.
//

import SwiftUI

struct EventView: View {
    @State private var event: Event
    private let baseHeight: CGFloat

    init(event: Event, baseHeight: CGFloat = 15) {
        _event = State(initialValue: event)
        self.baseHeight = baseHeight
    }

    var body: some View {
//        Button(event.title) {
//            print("on tap event")
//        }
//        .foregroundColor(Color(.systemYellow))
//        .font(.system(size: 8))
//        .padding(2)
//        .overlay(
//            RoundedRectangle(cornerRadius: 4)
//                .stroke(Color(.systemYellow), lineWidth: 2)
//                .frame(height: 100)
//        )
//        .background(Color(.darkGray))
//        .cornerRadius(4)

        Button(action: {
            print("on tap event")
        }) {
            Text(event.title)
                .fontWeight(.semibold)
                .font(.system(size: 8))
                .padding(2)
                .frame(height: baseHeight * 4)
                .foregroundColor(Color(.darkGray))
                .background(Color(.systemYellow))
                .cornerRadius(4)
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: .init(title: "レッスンの予定", date: Date(), allDay: false))
    }
}
