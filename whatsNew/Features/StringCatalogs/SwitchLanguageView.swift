//
//  SwitchLanguageView.swift
//  whatsNew
//
//  Created by HienNN on 13/11/2023.
//

import SwiftUI

struct SwitchLanguageView: View {
    @AppStorage(AppLanguages.APPLANGUAGE) var language: String = AppLanguages.en.rawValue
    var body: some View {
        Menu {
            ForEach(AppLanguages.allCases, id: \.self) { language in
                Button(action: {
                    AppLanguages.saveAppLanguage(language)
                }) {
                    Text(language.description)
                }
            }
        } label: {
            languageView(AppLanguages.getAppLanguage)
        }
        .padding(.vertical, 5)
        .padding(.horizontal)
        .border(width: 1, edges: [.bottom], color: .gray)
        .onChange(of: language) { _, _ in }
    }
    
    func languageView(_ language: AppLanguages) -> some View {
        HStack {
            Image(language.rawValue)
                .resizable()
                .frame(width: 25, height: 25)
            Text(language.description)
        }
    }
}

#Preview {
    SwitchLanguageView()
}
