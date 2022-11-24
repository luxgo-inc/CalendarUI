//
//  SampleApp.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/24.
//

import SwiftUI

@main
struct SampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
