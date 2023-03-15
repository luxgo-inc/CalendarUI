//
//  SettingHeaderView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/12/24.
//

import SwiftUI

struct SettingHeaderView: View {
    @State var month: String
    @Binding private var displayType: DisplayType
    
    init(baseDate: Date, displayType: Binding<DisplayType>) {
        let calendar = Calendar(identifier: .gregorian)
        self.month = String(calendar.component(.month, from: baseDate))
        _displayType = displayType
    }
    
    var body: some View {
        HStack(spacing: 12) {
            Menu {
                Button {
                    displayType = .day
                } label: {
                    Text("日表示")
                }
                
                Button {
                    displayType = .week
                } label: {
                    Text("週表示")
                }
                
                Button {
                    displayType = .month
                } label: {
                    Text("月表示")
                }
            } label: {
               Image(systemName: "gearshape")
                    .foregroundColor(.white)
            }
            Text(month + "月")
                .foregroundColor(.white)
        }
    }
}

struct SettingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SettingHeaderView(baseDate: .now, displayType: .constant(.month))
            .background(Color(.darkGray))
    }
}
