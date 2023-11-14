//
//  ToDo.swift
//  whatsNew
//
//  Created by HienNN on 13/11/2023.
//

import Foundation
import SwiftData

@Model
final public class ToDo {
    var uuid: UUID
    var title: String
    var complete: Bool
    var createdDate: Date
    var timestamp: Date
    
    init(
        title: String,
        complete: Bool,
        timestamp: Date
    ) {
        self.uuid = UUID()
        self.title = title
        self.complete = complete
        self.createdDate = Date()
        self.timestamp = timestamp
    }
}
