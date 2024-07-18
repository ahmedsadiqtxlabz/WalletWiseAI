//
//  AIInsightsTransactionView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 03/07/2024.
//

import SwiftUI

struct AIInsightsTransactionView: View {
    
    @Binding var goToRecomentation: Bool
    @Binding var goToTransactionDetails: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            TransactionRow()
                .onTapGesture {
                    self.goToTransactionDetails = true
                }
            recomendationView
                .onTapGesture {
                    self.goToRecomentation = true
                }
            Spacer()
        }
    }
}

extension AIInsightsTransactionView {
    
    var recomendationView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryBlue.color.withAlphaComponent(0.12)))
                .cornerRadius(10, corners: .allCorners)
            HStack(spacing: 5) {
                Image(uiImage: Asset.Home.transactionLogo.image)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Indrive")
                    .font(Font.SFPro.semiBold(size: 16))
                Text("(Save 10 %)")
                    .font(Font.SFPro.regular(size: 14))
                    .foregroundColor(.gray)
                Spacer()
                AIView
            }
            .padding(.all, 10)
        }
        .frame(height: 50)
        .padding(.horizontal, 5)
    }
    
    var AIView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryWhite.color))
                .cornerRadius(5, corners: .allCorners)
            HStack(spacing: 5) {
                Image(uiImage: Asset.Recommendations.recommendationsIcon.image)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("AI Recommended")
                    .foregroundColor(.black)
                    .font(Font.SFPro.medium(size: 11))
            }
        }
        .frame(width: 130)
    }
}

#Preview {
    AIInsightsTransactionView(
        goToRecomentation: Binding.constant(false),
        goToTransactionDetails: Binding.constant(false))
}
