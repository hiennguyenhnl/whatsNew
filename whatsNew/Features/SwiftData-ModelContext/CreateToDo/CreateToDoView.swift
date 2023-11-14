//
//  CreateToDoView.swift
//  whatsNew
//
//  Created by HienNN on 13/11/2023.
//

import SwiftUI

struct CreateToDoView: View {
    @EnvironmentObject var viewModel: CreateTodoViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var headerView: some View {
        HStack {
            Spacer()
            Button(action: {
                viewModel.add()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("DONE")
                    .font(.headline)
                    .environmentLocale
            }
        }
    }
    
    var body: some View {
        VStack {
            headerView
            
            VStack(alignment: .leading, spacing: 5) {
                Text("TITLE")
                    .font(.title)
                    .fontWeight(.bold)
                    .environmentLocale
                TextField("TITLE_PLACEHOLDER", text: $viewModel.title)
                    .environmentLocale
                    .autocorrectionDisabled()
                    .frame(height: 40)
                    .border(width: 0.5, edges: [.bottom], color: .gray)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("SCHEDULE")
                    .font(.title)
                    .fontWeight(.bold)
                    .environmentLocale
                
                DatePicker("", selection: $viewModel.timestamp)
                    .environmentLocale
                    .datePickerStyle(.compact)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CreateToDoView()
        .environmentObject(CreateTodoViewModel.preview)
}
