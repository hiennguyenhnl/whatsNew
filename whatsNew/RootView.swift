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
    @EnvironmentObject var viewModel: RootViewModel
    
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
        Button(action: { viewModel.isShowAddNew.toggle() }) {
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
        List(viewModel.toDoList) { item in
            HStack {
                CheckBox(isSelected: item.complete) {
                    item.complete.toggle()
                }
                Text(item.title)
                Spacer()
                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text(item.timestamp.formatted(Date.FormatStyle.time))
                }
            }
            .swipeActions(edge: .trailing) {
                Button(action: {
                    viewModel.delete(item: item)
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
        .sheet(isPresented: $viewModel.isShowAddNew) {
            if let createTodoViewModel = viewModel.createTodoViewModel {
                CreateToDoView()
                    .environmentObject(createTodoViewModel)
            }
        }
        .padding(.horizontal)
        .onChange(of: language) { _, _ in }
        .onAppear {
            viewModel.onAppear()
        }
    }
}


#Preview {
    RootView()
        .environmentObject(RootViewModel.preview)
        .environment(\.locale, AppLanguages.getAppLanguage.locale)
}
