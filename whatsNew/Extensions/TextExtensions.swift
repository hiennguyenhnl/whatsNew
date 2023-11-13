//
//  TextExtensions.swift
//  whatsNew
//
//  Created by HienNN on 13/11/2023.
//

import Foundation
import SwiftUI

public extension Text {
    var environmentLocale: some View {
        self.environment(\.locale, AppLanguages.getAppLanguage.locale)
    }
}
