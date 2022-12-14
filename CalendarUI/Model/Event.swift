//
//  Event.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/30.
//

import Foundation

struct Event: Equatable, Identifiable, Hashable {
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
        // TODO: 単純にEventに対するconflictEventだと正確なpositionが算出できないので、
        // TODO: recursiveにconflictEventを検索してpositionを見る
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
        let calendar = Calendar(identifier: .gregorian)
         
        let hour: CGFloat = CGFloat(calendar.component(.hour, from: startTime))
        let minute: CGFloat = CGFloat(calendar.component(.minute, from: startTime)) / 60.0
   
        return round(((hour + minute) / 24.0) * 100) / 100
    }
    
    var maxConflictCount: Int {
        if let maxEvent = conflictEvents.max(by: { $0.conflictEvents.count < $1.conflictEvents.count }) {
            return max(maxEvent.conflictEvents.count, conflictEvents.count)
        }
        return 0
    }
   
    // conflictEventsの1階層掘り下げて取得する
    // Setで返し、Eventにおける一意性を担保する
    func sortedConflictEventsBy(depth: Int = 1) -> Set<Event> {
        var events: Set = .init(conflictEvents)
        conflictEvents.forEach {
            // 自身のEventは含めない
            $0.conflictEvents.forEach { event in
                if event != self {
                    events.insert(event)
                }
            }
        }
 
//        return .init(events.sorted(by: {
//            if $0.startTime == $1.startTime {
//                return $0.endTime < $1.endTime
//            }
//            return $0.startTime > $1.startTime
//        }))
        return events
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
    
    func positionX(width: CGFloat) -> CGFloat {
//        if conflictPositionX == 1 { return 0 }
    
        // +1はEvent自身
//        guard let conflictEventIndex = sortedConflictEventsBy().index(of: self) .firstIndex(where: { $0 != self }) else { return 0 }
//        guard let conflictEventIndex = sortedConflictEventsBy().firstIndex(of: self) else { return 0 }
//        return width / CGFloat(maxConflictCount + 1) * CGFloat(conflictEventIndex)
        return width / CGFloat(maxConflictCount + 1) * CGFloat((conflictPositionX - 1))
    }
    // TODO: 現状の実装だと、上記conflictPositionXでEvent4などのケースにおいてpositionが2となるため、
    // TODO: event1, 2とかぶってしまう
    
    // TODO: ↑の問題は、イベントごとにグループ分けして、グループ間で依存関係を持つようにすると解決できるかも
    // TODO: 例えば、E1, E2, E3 -> G1, E4 -> G2
    // TODO: G2はG1に依存している
    // TODO: ただし、どのようにグループ分けを行うか -> Eventをstart順に管理してconflictEventsまでがグループ1にする
    // TODO: 極論、グループ2ではグループ1での依存におけるwidthがわかれば良いので管理しなくてよい
    
}
