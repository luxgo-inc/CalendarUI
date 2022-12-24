//
//  CalendarViewModel.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/12/21.
//

import Combine

    // TODO: calendarViewModelを作成し、EventやMonthなどのModelを整形する
class CalendarViewModel: ObservableObject {
    @Published var displayType: DisplayType
    
    init(displayType: DisplayType) {
        self.displayType = displayType
    }
}
