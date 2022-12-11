//
//  EventTests.swift
//  CalendarUITests
//
//  Created by Keigo Nakagawa on 2022/12/11.
//

import XCTest
@testable import CalendarUI

final class EventTests: XCTestCase {
    let calendar = Calendar(identifier: .japanese)
    var event1: Event!
    var event2: Event!
    var event3: Event!
    var event4: Event!
    
    override func setUpWithError() throws {
        /// 2022/12/10 9:30 〜 10:30 の日時を生成
        let event1StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 9, minute: 30, second: 0))!
        let event1EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 30, second: 0))!
        event1 = .init(title: "イベント1", startTime: event1StartTime, endTime: event1EndTime, allDay: false)

        /// 2022/12/10 10:00 〜 10:30 の日時を生成
        let event2StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 0, second: 0))!
        let event2EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 30, second: 0))!
        event2 = .init(title: "イベント2", startTime: event2StartTime, endTime: event2EndTime, allDay: false)
        
        /// 2022/12/10 10:00 〜 11:00 の日時を生成
        let event3StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 0, second: 0))!
        let event3EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 11, minute: 0, second: 0))!
        event3 = .init(title: "イベント3", startTime: event3StartTime, endTime: event3EndTime, allDay: false)
        
        /// 2022/12/10 10:30 〜 12:00 の日時を生成
        let event4StartTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 10, minute: 30, second: 0))!
        let event4EndTime = calendar.date(from: DateComponents(year: 2022, month: 12, day: 10, hour: 12, minute: 0, second: 0))!
        event4 = .init(title: "イベント4", startTime: event4StartTime, endTime: event4EndTime, allDay: false)
    }

    func testScheduledTime() throws {
        XCTAssertEqual(event1.scheduledTime, 1.0)
        XCTAssertEqual(event2.scheduledTime, 0.5)
        XCTAssertEqual(event3.scheduledTime, 1.0)
        XCTAssertEqual(event4.scheduledTime, 1.5)
    }
    
    func testConflictPositionX() throws {
        XCTContext.runActivity(named: "for Event1") { _ in
            event1.conflictEvents = [event2, event3]
            XCTAssertEqual(event1.conflictPositionX, 1)
        }
        
        XCTContext.runActivity(named: "for Event2") { _ in
            event2.conflictEvents = [event1, event3]
            XCTAssertEqual(event2.conflictPositionX, 2)
        }
        
        XCTContext.runActivity(named: "for Event3") { _ in
            event3.conflictEvents = [event1, event2, event4]
            XCTAssertEqual(event3.conflictPositionX, 3)
        }
        
        XCTContext.runActivity(named: "for Event4") { _ in
            event4.conflictEvents = [event3]
            XCTAssertEqual(event4.conflictPositionX, 2)
        }
    }
    
    func testPositionY() throws {
        XCTAssertEqual(event1.positionY, 0.4)
        XCTAssertEqual(event2.positionY, 0.42)
        XCTAssertEqual(event3.positionY, 0.42)
        XCTAssertEqual(event4.positionY, 0.44)
    }
    
    func testIsConflict() throws {
        XCTContext.runActivity(named: "for Event1") { _ in
            XCTAssertTrue(event1.isConflict(targetEvent: event2))
            XCTAssertTrue(event1.isConflict(targetEvent: event3))
            XCTAssertFalse(event1.isConflict(targetEvent: event4))
        }
        
        XCTContext.runActivity(named: "for Event2") { _ in
            XCTAssertTrue(event2.isConflict(targetEvent: event1))
            XCTAssertTrue(event2.isConflict(targetEvent: event3))
            XCTAssertFalse(event2.isConflict(targetEvent: event4))
        }
        
        XCTContext.runActivity(named: "for Event3") { _ in
            XCTAssertTrue(event3.isConflict(targetEvent: event1))
            XCTAssertTrue(event3.isConflict(targetEvent: event2))
            XCTAssertTrue(event3.isConflict(targetEvent: event4))
        }
        
        XCTContext.runActivity(named: "for Event4") { _ in
            XCTAssertFalse(event4.isConflict(targetEvent: event1))
            XCTAssertFalse(event4.isConflict(targetEvent: event2))
            XCTAssertTrue(event4.isConflict(targetEvent: event3))
        }
    }
        
}
