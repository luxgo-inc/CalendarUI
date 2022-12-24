//
//  CalendarManager.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/12/21.
//

import Foundation

public protocol CalendarManagerProtocol {
}

// TODO: 外部からのデータを受け取るinterface
// TODO: 表示する対象の日付と、Eventsデータ(Dayでもらうようにする)は外から渡せるように
public class CalendarManager: CalendarManagerProtocol {
    public static var shared = CalendarManager()
    
    private init() {
    }
}
