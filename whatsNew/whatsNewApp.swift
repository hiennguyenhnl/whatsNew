//
//  whatsNewApp.swift
//  whatsNew
//
//  Created by HienNN on 13/11/2023.
//

import SwiftUI
import SwiftData

class AppDependencies {
    private lazy var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ToDo.self
        ])
        
        do {
            return try ModelContainer(for: schema)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    @MainActor public lazy var rootViewModel = RootViewModel(modelContext: sharedModelContainer.mainContext)
}

@main
struct whatsNewApp: App {
    private let dependencies = AppDependencies()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(dependencies.rootViewModel)
        }
    }
}
