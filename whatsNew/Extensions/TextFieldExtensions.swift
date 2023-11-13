//
//  TextFieldExtensions.swift
//  whatsNew
//
//  Created by HienNN on 13/11/2023.
//

import Foundation
import SwiftUI

public extension TextField {
    var environmentLocale: some View {
        self.environment(\.locale, AppLanguages.getAppLanguage.locale)
    }
}
