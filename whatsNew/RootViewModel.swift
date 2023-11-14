//
//  RootViewModel.swift
//  whatsNew
//
//  Created by HienNN on 14/11/2023.
//

import Foundation
import SwiftData
import Combine

public class RootViewModel: ObservableObject {
    @Published public var isShowAddNew: Bool = false
    @Published public var createTodoViewModel: CreateTodoViewModel? = nil
    @Published public var toDoList: [ToDo] = []
    
    let modelContext: ModelContext
    private var cancellables = Set<AnyCancellable>()
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        self.createTodoViewModel = CreateTodoViewModel(modelContext: self.modelContext)
        initialize()
        
        NotificationCenter.default.addObserver(self, selector: #selector(observeDidSave), name: Notification.Name.NSManagedObjectContextObjectsDidChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.NSManagedObjectContextObjectsDidChange, object: nil)
    }

    @objc func observeDidSave(_ notification: Notification) {
        self.fetchData()
    }
    
    func onAppear() {
        self.fetchData()
    }
    
    func delete(item: ToDo) {
        self.modelContext.delete(item)
    }
}

private extension RootViewModel {
    func initialize() {
        $isShowAddNew
            .map {[weak self] isShow in
                guard let self = self else { return nil }
                return isShow ? CreateTodoViewModel(modelContext: self.modelContext) : nil
            }
            .receive(on: DispatchQueue.main)
            .assign(to: &$createTodoViewModel)
    }
    
    func fetchData() {
        do {
            let descriptor = FetchDescriptor<ToDo>(sortBy: [SortDescriptor(\.createdDate)])
            toDoList = try self.modelContext.fetch(descriptor)
        } catch {
            print("fetch data: Fail")
        }
    }
}

extension RootViewModel {
    static var preview: RootViewModel {
        let schema = Schema([ToDo.self])
        let modelContainer: ModelContainer = try! ModelContainer(for: schema, configurations: [ModelConfiguration(isStoredInMemoryOnly: true)])
        return RootViewModel(modelContext: ModelContext(modelContainer))
    }
}
