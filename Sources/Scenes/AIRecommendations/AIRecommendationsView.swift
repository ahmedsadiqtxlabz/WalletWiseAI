//
//  AIRecommendationsView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 26/06/2024.
//

import SwiftUI

struct AIRecommendationsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            headerView
            infoView
            Spacer()
        }
        .padding(.top, 60)
        .background(Color(Asset.Colors.primaryLightGray.color))
        .edgesIgnoringSafeArea(.all)
    }
}

extension AIRecommendationsView {
    var headerView: some View {
        ZStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(uiImage: Asset.backArrow.image)
                        .frame(width: 20, height: 20)
                })
                Spacer()
            }
            .padding(.horizontal, 15)
            
            Text(L10n.Recommendations.title)
                .font(Font.SFPro.semiBold(size: 18))
        }
    }
}

var infoView: some View {
    ZStack(alignment: .center) {
        Rectangle()
            .foregroundColor(Color(Asset.Colors.primaryWhite.color))
            .cornerRadius(10, corners: .allCorners)
        VStack(alignment: .center, spacing: 10) {
            Image(uiImage: Asset.Recommendations.recommendationsIcon.image)
            Text(L10n.Recommendations.description)
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.gray)
                .font(Font.SFPro.regular(size: 17))
            Spacer()
        }
        .padding(.top, -50)
        
    }
    .frame(height: 180)
    .padding(EdgeInsets(top: 60, leading: 15, bottom: 0, trailing: 15))
}

#Preview {
    AIRecommendationsView()
}
