//
//  CreateTodoViewModel.swift
//  whatsNew
//
//  Created by HienNN on 14/11/2023.
//

import Foundation
import SwiftData

public class CreateTodoViewModel: ObservableObject {
    @Published public var title: String = ""
    @Published public var timestamp: Date = Date()
    @Published public var saved: Bool = false
    
    let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func add() {
        let model = ToDo(title: title, complete: false, timestamp: timestamp)
        modelContext.insert(model)
        saved.toggle()
    }
}

extension CreateTodoViewModel {
    static var preview: CreateTodoViewModel {
        let schema = Schema([ToDo.self])
        let modelContainer: ModelContainer = try! ModelContainer(for: schema, configurations: [ModelConfiguration(isStoredInMemoryOnly: true)])
        return CreateTodoViewModel(modelContext: ModelContext(modelContainer))
    }
}
