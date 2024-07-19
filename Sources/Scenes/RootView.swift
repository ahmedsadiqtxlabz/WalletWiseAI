//
//  RootView.swift
//  WalletWiseAI
//
//  Created by Muhammad Arslan on 02/05/2024.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        rootView
    }
    
    private var rootView: some View {
        Group {
            if DefaultsService.token.isEmpty {
                WelcomeView()
            } else {
                MainView()
            }
        }
    }
}
