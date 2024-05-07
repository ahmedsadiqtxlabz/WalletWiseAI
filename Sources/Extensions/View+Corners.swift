//
//  View+Corners.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 03/05/2024.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
