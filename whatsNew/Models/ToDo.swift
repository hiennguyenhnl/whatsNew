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
    @Attribute(.unique) var uuid: UUID
    var title: String
    var complete: Bool
    var createdDate: TimeInterval
    var timestamp: TimeInterval
    
    init(
        title: String = "",
        complete: Bool = false,
        timestamp: TimeInterval = Date().timeIntervalSince1970
    ) {
        self.uuid = UUID()
        self.title = title
        self.complete = complete
        self.createdDate = Date().timeIntervalSince1970
        self.timestamp = timestamp
    }
}
