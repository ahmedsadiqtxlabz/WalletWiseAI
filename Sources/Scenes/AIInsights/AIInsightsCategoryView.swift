//
//  AIInsightsCategoryView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 03/07/2024.
//

import SwiftUI

struct AIInsightsCategoryView: View {
    
    let title: String
    let icon: UIImage
    
    var body: some View {
        VStack(spacing: 5) {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color.gray)
                    .background(Color(Asset.Colors.primaryWhite.color))
                    .cornerRadius(10, corners: .allCorners)
                Image(uiImage: icon)
            }
            .frame(width: 70, height: 70)
            Text(title)
                .foregroundColor(Color.gray)
                .font(Font.SFPro.medium(size: 12))
        }
    }
    
}

#Preview {
    AIInsightsCategoryView(title: "", icon: Asset.Categories.foodIcon.image)
}
