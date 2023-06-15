//
//  SampleApp.swift
//  CalendarUI
//
//  Created by Keigo Nakagawa on 2022/11/24.
//

import SwiftUI
import CalendarUI

@main
struct SampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .tabItem {
                        Label("Account", systemImage: "person.crop.circle.fill")
                    }
                
                CalendarView(type: .month, events: [])
                    .tabItem {
                        Label("Calendar", systemImage: "person.crop.circle.fill")
                    }
            }
            .tabViewStyle(.automatic)
        }
    }
}
