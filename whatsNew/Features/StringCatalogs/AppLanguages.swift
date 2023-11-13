//
//  AppLanguages.swift
//  whatsNew
//
//  Created by HienNN on 13/11/2023.
//

import Foundation

public enum AppLanguages: String, CaseIterable {
    case en
    case vi
    
    public var languageCode: String {
        switch self {
        case .en:
            return "en"
        case .vi:
            return "vi"
        }
    }
    
    public var description: String {
        switch self {
        case .en:
            return "English"
        case .vi:
            return "VietNamese"
        }
    }

    public var locale: Locale {
        return Locale(identifier: self.languageCode)
    }
    
    public static let APPLANGUAGE = "AppLanguage"
    
    public static var getAppLanguage: AppLanguages {
        guard let languageString = UserDefaults.standard.string(forKey: Self.APPLANGUAGE),
              let language = AppLanguages(rawValue: languageString)
        else {
            guard let preferredIdentifier = Locale.preferredLanguages.first, let languageCode = Locale(identifier: preferredIdentifier).language.languageCode?.identifier else { return .en }
            return AppLanguages(rawValue: languageCode) ?? .en
        }
        return language
    }
    
    public static func saveAppLanguage(_ appLanguages: AppLanguages?) {
        let language = appLanguages ?? .en
        UserDefaults.standard.setValue(language.rawValue, forKey: Self.APPLANGUAGE)
    }
}
