//
//  DatePickerExtensions.swift
//  whatsNew
//
//  Created by HienNN on 13/11/2023.
//

import Foundation
import SwiftUI

public extension DatePicker {
    var environmentLocale: some View {
        self.environment(\.locale, AppLanguages.getAppLanguage.locale)
    }
}
