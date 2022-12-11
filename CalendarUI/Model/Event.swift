//
//  Event.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/30.
//

import Foundation

struct Event: Equatable, Identifiable {
    var id: String {
        title + "\(startTime.timeIntervalSince1970)" + "\(endTime.timeIntervalSince1970)"
    }
    
    let title: String
    let startTime: Date
    let endTime: Date
    let allDay: Bool
    
    var conflictEvents: [Event] = []
}

extension Event {
    // 10:00 〜 11:30であれば、1.5を返す
    var scheduledTime: Double {
        let time = endTime.timeIntervalSince(startTime)
        return time/60/60
    }
  
    // かぶっているイベント間でstartTimeを比較してwidth分ズラすための、positionを返す
    // 例: 1つのEventとかぶっていて、startTimeが早い場合は 0, 遅い場合は 1 を返す
    var conflictPositionX: Int {
//        var positionX: CGFloat = 0
        var position: Int = 1
        conflictEvents.forEach {
            // 開始時間が同じであれば、終了時間が早い方を優先する
            if startTime == $0.startTime {
                if endTime > $0.endTime {
                    position += 1
                }
            }
            
            if startTime > $0.startTime {
                position += 1
            }
        }
        return position
    }
   
    // TODO: 15分刻みでのheigthを算出して、
    // 12:00 〜 12:30であれば、0.52を返す
    var positionY: CGFloat {
        let calendar = Calendar(identifier: .japanese)
         
        let hour: CGFloat = CGFloat(calendar.component(.hour, from: startTime))
        let minute: CGFloat = CGFloat(calendar.component(.minute, from: startTime)) / 60.0
   
        return round(((hour + minute) / 24.0) * 100) / 100
    }
    
    // イベントの重複におけるロジック
    // start timeにより条件を変更する
    func isConflict(targetEvent: Event) -> Bool {
        // 1. start(base) < start(target) -> end(base) > start(target) == かぶっている
        if startTime < targetEvent.startTime {
            return endTime > targetEvent.startTime
        }
        
        // 2. start(base) > start(target) -> start(base) > end(target) == かぶっている
        if startTime > targetEvent.startTime {
            return startTime < targetEvent.endTime
        }
        
        // 3. start(base) == start(target) -> かぶっている
        return startTime == targetEvent.startTime
    }
}
