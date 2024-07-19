//
//  BorderButtonStyle.swift
//  WalletWiseAI
//
//  Created by Muhammad Arslan on 02/05/2024.
//

import SwiftUI

struct BorderButtonStyle: ViewModifier {
    
    enum State {
        case enabled
        case disabled
    }
    
    let state: State
    let strokeColor: Color
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(color)
            .background(Color.clear)
            .cornerRadius(10, corners: .allCorners)
            .overlay(RoundedRectangle(
                cornerRadius: 10).stroke(strokeColor, lineWidth: 2))
    }
}
