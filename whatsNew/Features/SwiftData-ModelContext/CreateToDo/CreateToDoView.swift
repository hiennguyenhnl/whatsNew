//
//  CreateToDoView.swift
//  whatsNew
//
//  Created by HienNN on 13/11/2023.
//

import SwiftUI

struct CreateToDoView: View {
    var headerView: some View {
        HStack {
            Spacer()
            Button(action: {
                
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
                TextField("TITLE_PLACEHOLDER", text: .constant(""))
                    .environmentLocale
                    .frame(height: 40)
                    .border(width: 0.5, edges: [.bottom], color: .gray)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("SCHEDULE")
                    .font(.title)
                    .fontWeight(.bold)
                    .environmentLocale
                
                DatePicker("", selection: .constant(Date()))
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
}
