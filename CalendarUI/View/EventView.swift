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
        .lineLimit(1)
        .font(.system(size: 8))
        .padding(2)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color(.systemYellow), lineWidth: 2)
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
