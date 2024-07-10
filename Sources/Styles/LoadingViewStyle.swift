//
//  LoadingViewStyle.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 10/07/2024.
//

import SwiftUI

struct  LoadingViewStyle: ViewModifier {
    @Binding var isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isLoading {
                ActivityIndicator(isAnimating: $isLoading, style: .large)
            } else {
                content
            }
        }
    }
}
