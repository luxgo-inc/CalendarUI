//
//  MonthViewModel.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/12/14.
//

import Combine

class MonthViewModel: ObservableObject {
    @Published var current: Date
    @Published var month: [Day]
   // TODO: Eventを6分割して、1・6行目を空白で埋めるようにハンドリングする
    
    init(month: [Day]) {
        self.month = month
        self.current = .now
    }
}
