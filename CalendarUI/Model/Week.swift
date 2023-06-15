//
//  Week.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/30.
//

import Foundation

public struct Week {
    let days: [Day]
    
    public init(days: [Day]) {
        self.days = days
    }
}
