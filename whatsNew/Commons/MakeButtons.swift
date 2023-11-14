//
//  MakeButtons.swift
//  whatsNew
//
//  Created by HienNN on 13/11/2023.
//

import SwiftUI

struct CheckBox: View {
    let isSelected: Bool
    let action: () -> Void
    
    init(
        isSelected: Bool,
        action: @escaping () -> Void
    ) {
        self.isSelected = isSelected
        self.action = action
    }
    
    private var size: CGFloat = 30

    public var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "checkmark.seal")
                    .resizable()
                    .foregroundColor(isSelected ? .green : .gray)
                    .frame(width: size, height: size)
            }
        }
        .buttonStyle(.plain)
    }
    
    func size(_ size: CGFloat) -> Self {
        var view = self
        view.size = size
        return view
    }
}

#Preview {
    CheckBox(isSelected: true, action: {})
}
