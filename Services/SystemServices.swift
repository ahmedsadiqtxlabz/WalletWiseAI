//
//  SystemServices.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 02/05/2024.
//

import Foundation
import SwiftUI

struct SystemServices: ViewModifier {
    
    static var firebaseService = FirebaseService()
    
    func body(content: Content) -> some View {
        content
            .accentColor(Color(Asset.Colors.primaryBlue.color))
            .environmentObject(Self.firebaseService)
    }
}

