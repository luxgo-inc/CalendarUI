//
//  DayEventScheduleView.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/12/10.
//

import SwiftUI

struct DayEventScheduleView: View {
    var events: [Event]
    
    init(events: [Event]) {
        self.events = events
        
        checkConflictEvent()
    }
    
    var body: some View {
            ZStack(alignment: .leading) {
        GeometryReader { geometry in
//                    VStack(spacing: 8) {
                ForEach(events) { event in
                    // TODO: width   -> full width / かぶっている数（0の場合はfull）
                    // TODO: height  -> full height / (time / 24)
                    // TODO: point X -> かぶっているイベント間でstartを比較して、width分ズラす
                    // TODO: point Y -> 時間軸を座標に変換し、(start time / 24) x full height
                    // position x -> conflictが無い or 1番目であれば、x = 0
                        EventView(event: event,
//                                  width: geometry.size.width / CGFloat(event.conflictEvents.count+1),
//                                  width: geometry.size.width / CGFloat(event.maxConflictCount+1),
                                  width: geometry.size.width / CGFloat(event.maxConflictCount),
                                  height: geometry.size.height / 24 * event.scheduledTime)
//                            .offset(x: event.conflictPositionX == 1 ? 0 :
//                                    geometry.size.width * 1 / CGFloat(event.conflictPositionX),
                    // TODO: x および widthをmaxConflictCountで調整する
                        .offset(x: event.positionX(width: geometry.size.width),
                                      y: event.positionY * geometry.size.height)
//                                    y: event.title == "イベント1" ? 379.5 : 379.5)
                
                
                
                
//                            .offset(x: event.conflictEvents.isEmpty ? 0 :
////                                    geometry.size.width / (CGFloat(event.conflictEvents.count) * event.conflictPositionX),
//                                    geometry.size.width * event.conflictPositionX,
//                            .offset(x: 0,
//                                      y: event.positionY * geometry.size.height)
//                            .position(x: geometry.size.width / CGFloat(event.conflictEvents.count) * event.conflictPositionX,
//                                      y: event.positionY * geometry.size.height)
                       
                    // TODO: fix position Y
//                        Text("conflicts: \(event.conflictEvents.count)")
//                        Text("conflictPositionX: \(event.conflictPositionX)")
//                        Text("width: \(geometry.size.width / CGFloat(event.conflictEvents.count+1))")
//                        Text("height: \(geometry.size.height / 24 * event.scheduledTime)")
//                        Text(" positionX: \(geometry.size.width * (CGFloat(event.conflictEvents.count) * event.conflictPositionX))")
//                        Text("positionY: \(event.positionY * geometry.size.height)")
//                    }
//                    Text("base width: \(geometry.size.width), height: \(geometry.size.height)")
                }
                Text("base width: \(geometry.size.width), height: \(geometry.size.height)")
            }
        }
    }
    
    private mutating func checkConflictEvent() {
        for (idx, event) in events.enumerated() {
            self.events[idx].conflictEvents = events.filter { $0 != event && event.isConflict(targetEvent: $0) }
        }
    }
}

struct DayEventScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        let calendar = Calendar(identifier: .gregorian)
        
        /// 2022/12/10 9:30 〜 10:30 の日時を生成
        let event1StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 9, minute: 30, second: 0))!
        let event1EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 30, second: 0))!
        let event1: Event = .init(title: "イベント1", startTime: event1StartTime, endTime: event1EndTime, allDay: false)

        /// 2022/12/10 10:00 〜 10:30 の日時を生成
        let event2StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 0, second: 0))!
        let event2EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 30, second: 0))!
        let event2: Event = .init(title: "イベント2", startTime: event2StartTime, endTime: event2EndTime, allDay: false)
        
        /// 2022/12/10 10:00 〜 11:00 の日時を生成
        let event3StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 0, second: 0))!
        let event3EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 11, minute: 0, second: 0))!
        let event3: Event = .init(title: "イベント3", startTime: event3StartTime, endTime: event3EndTime, allDay: false)
        
        /// 2022/12/10 10:30 〜 12:00 の日時を生成
        let event4StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 30, second: 0))!
        let event4EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 12, minute: 0, second: 0))!
        let event4: Event = .init(title: "イベント4", startTime: event4StartTime, endTime: event4EndTime, allDay: false)
        
        return DayEventScheduleView(events: [event1, event2, event3, event4])
//        return DayEventScheduleView(events: [event3, event4])
//        return DayEventScheduleView(events: [event1, event2, event3])
//        return DayEventScheduleView(events: [event1, event3])
//        return DayEventScheduleView(events: [event1])
    }
}
