//
//  MonthViewModel.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/12/14.
//

import Combine

class MonthViewModel: ObservableObject {
    @Published var current: Date
    @Published var days: [Day]
    @Published var month: Date
    @Published var week1: [Day] = []
    @Published var week2: [Day] = []
    @Published var week3: [Day] = []
    @Published var week4: [Day] = []
    @Published var week5: [Day] = []
    @Published var week6: [Day] = []
    
   // TODO: Eventを6分割して、1・6行目を空白で埋めるようにハンドリングする
    init(month: Month) {
        self.days = month.days
        self.month = month.target
        self.current = .now
        
        let calendar = Calendar(identifier: .gregorian)
        
        let targetYear: Int = calendar.component(.year, from: month.target)
        let targetMonth: Int = calendar.component(.month, from: month.target)
        
        let startOfMonth = calendar.component(.day, from: month.target.startOfMonth())
        let endOfMonth = calendar.component(.day, from: month.target.endOfMonth())
       
        // 対象月の1日を取得
        let firstWeekday = calendar.component(.weekday, from: month.target.startOfMonth())
        let endWeekday = calendar.component(.weekday, from: month.target.endOfMonth())
    
        // 第1週目の空白日付をセット
        for _ in 0 ..< firstWeekday - 1 {
            week1.append(.makeEmpty())
        }
       
        // TODO: セットday event
        for day in startOfMonth ... endOfMonth {
            if week1.count != 7 {
                week1.append(.init(date: calendar.date(from: DateComponents(year: targetYear, month: targetMonth, day: day)), events: []))
                continue
            }
            
            if week2.count != 7 {
                week2.append(.init(date: calendar.date(from: DateComponents(year: targetYear, month: targetMonth, day: day)), events: month.days.first!.events))
                continue
            }
            
            if week3.count != 7 {
                week3.append(.init(date: calendar.date(from: DateComponents(year: targetYear, month: targetMonth, day: day)), events: []))
                continue
            }
            
            if week4.count != 7 {
                week4.append(.init(date: calendar.date(from: DateComponents(year: targetYear, month: targetMonth, day: day)), events: []))
                continue
            }
            
            if week5.count != 7 {
                week5.append(.init(date: calendar.date(from: DateComponents(year: targetYear, month: targetMonth, day: day)), events: []))
                continue
            }
            
            if week6.count != 7 {
                week6.append(.init(date: calendar.date(from: DateComponents(year: targetYear, month: targetMonth, day: day)), events: []))
                continue
            }
        }
        
        // 最終週の空白日付をセット
        // 5週目が7日分埋まってなかったら、6週目は空にして5週目を埋める
        if week5.count != 7 {
            for _ in 0 ..< 7 - endWeekday {
                week5.append(.makeEmpty())
            }
        } else {
            for _ in 0 ..< 7 - endWeekday {
                week6.append(.makeEmpty())
            }
        }
    }
}
