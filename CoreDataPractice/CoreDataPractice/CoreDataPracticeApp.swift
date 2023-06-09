//
//  CoreDataPracticeApp.swift
//  CoreDataPractice
//
//  Created by Rapipay on 13/03/23.
//

import SwiftUI

@main
struct CoreDataPracticeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
