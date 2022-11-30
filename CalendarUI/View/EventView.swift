//
//  EventView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/30.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        Button("レッスンの予定") {
            print("on tap event")
        }
        .foregroundColor(Color(.systemYellow))
        .font(.caption2)
        .padding(2)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color(.systemYellow), lineWidth: 1.5)
        )
        .background(Color(.darkGray))
        .cornerRadius(4)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
