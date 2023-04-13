//
//  JustEatQApp.swift
//  JustEatQ
//
//  Created by Rapipay on 15/03/23.
//

import SwiftUI

@main
struct JustEatQApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .EnvironmentObject(UserSettings())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
