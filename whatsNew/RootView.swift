//
//  RootView.swift
//  whatsNew
//
//  Created by HienNN on 13/11/2023.
//

import SwiftUI
import SwiftData

struct RootView: View {
    @AppStorage(AppLanguages.APPLANGUAGE) var language: String = AppLanguages.en.rawValue
    @Environment(\.modelContext) private var context
    @Query(sort: \ToDo.createdDate, order: .forward) var toDoList: [ToDo]
    @State var isShowAddNew: Bool = false
    
    var headerView: some View {
        HStack {
            Text("TODAY")
                .font(.title)
                .fontWeight(.bold)
                .environmentLocale
            Spacer()
            SwitchLanguageView()
        }
    }
    
    var addNew: some View {
        Button(action: { isShowAddNew.toggle() }) {
            HStack {
                Image(systemName: "plus")
                    .fontWeight(.bold)
                Text("ADDNEW")
                    .fontWeight(.bold)
                    .environmentLocale
                Spacer()
            }
        }
    }
    
    var listView: some View {
        List(toDoList) { item in
            HStack {
                CheckBox(isSelected: item.complete) {
                    item.complete.toggle()
                }
                Text(item.title)
            }
            .swipeActions(edge: .trailing) {
                Button(action: {
                    context.delete(item)
                }) {
                    Image(systemName: "trash")
                }
                .tint(.red)
            }
        }
        .listStyle(.plain)
    }
    
    var body: some View {
        VStack {
            headerView
            addNew
            listView
            
            Spacer()
        }
        .sheet(isPresented: $isShowAddNew) {
            CreateToDoView()
        }
        .padding(.horizontal)
        .onChange(of: language) { _, _ in }
    }
}


#Preview {
    RootView()
        .modelContainer(for: ToDo.self, inMemory: true)
        .environment(\.locale, AppLanguages.getAppLanguage.locale)
}
