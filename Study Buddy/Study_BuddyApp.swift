//
//  Study_BuddyApp.swift
//  Study Buddy
//
//  Created by Dagmar Beckel on 7/18/23.
//

import SwiftUI
@main
struct Study_BuddyApp: App {
    let persistenceController = PersistenceController.shared
    let dateHolder = DateHolder()
    var body: some Scene {
        WindowGroup {
            WelcomeView().environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dateHolder)
           
        }
    }
}

