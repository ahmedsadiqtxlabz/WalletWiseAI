//
//  RootView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 02/05/2024.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        rootView
    }
    
    private var rootView: some View {
        Group {
            WelcomeView()
                .onAppear {
                    print("Root View Appeared")
                }
                .onDisappear {
                    print("Root View Disappeared")
                }
        }
    }
}
