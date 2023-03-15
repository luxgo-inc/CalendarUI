//
//  Month.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/12/14.
//

import Foundation

public struct Month {
    let target: Date
    let days: [Day]
    
    public init(target: Date, days: [Day]) {
        self.target = target
        self.days = days
    }
}
