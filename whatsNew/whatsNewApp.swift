//
//  whatsNewApp.swift
//  whatsNew
//
//  Created by HienNN on 13/11/2023.
//

import SwiftUI
import SwiftData

@main
struct whatsNewApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ToDo.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(sharedModelContainer)
    }
}
