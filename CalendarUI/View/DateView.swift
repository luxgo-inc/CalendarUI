//
//  DateView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/12/18.
//

import SwiftUI

struct DateView: View {
    private let date: String
    private let highlight: Bool
    
    init(date: String) {
        self.date = date
        
        let calendar = Calendar(identifier: .gregorian)
        let day = calendar.component(.day, from: .now)
        self.highlight = String(day) == date
    }
    
    var body: some View {
        Text(date)
            .font(.caption)
            .foregroundColor(Color(.white))
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(Color(highlight ? .orange : .clear))
            .clipShape(Capsule())
    }
}

struct DayOfView: View {
    private let dayof: String
    
    init(dayof: String) {
        self.dayof = dayof
    }
    
    var body: some View {
        Text(dayof)
            .font(.caption)
            .foregroundColor(Color(.white))
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DayOfView(dayof: "水")
            DateView(date: "4")
            DateView(date: "11")
            DateView(date: "18")
        }
        .background(Color(.black))
    }
}
