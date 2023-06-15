//
//  CalendarManager.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/12/21.
//

import Foundation
import SwiftUI

// TODO: 外部からのデータを受け取るinterface
public class CalendarManager: ObservableObject {
    @Published var events: [Event]
    @Published var displayType: DisplayType
    
    public init(type: DisplayType, events: [Event]) {
        self.displayType = type
        self.events = events
    }
    
    func changeDisplayType(type: DisplayType) {
        displayType = type
    }
}
