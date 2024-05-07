//
//  IntroPageView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 07/05/2024.
//

import SwiftUI

struct IntroPageView: View {
    var title: String
    var detail: String
    var image: UIImage
    var index: Int
    var body: some View {
        ZStack(alignment: .center) {
            Image(uiImage: Asset.OnBoarding.Intro.background.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack(alignment: .center) {
                Spacer()
                Image(uiImage: image)
                    .padding(.bottom, 40)
                bottomView
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var bottomView: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(Color(Asset.Color.primaryLightGray.color))
                .cornerRadius(60, corners: [.topRight])
            VStack(alignment: .center, spacing: 15) {
                HStack {
                    Text(title)
                        .font(Font.SFPro.bold(size: 23))
                    Spacer()
                }
                HStack {
                    Text(detail)
                        .font(Font.SFPro.regular(size: 17))
                    Spacer()
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 35, leading: 20, bottom: 20, trailing: 20))
        }
        .frame(height: 330)
    }
}

#Preview {
    IntroPageView(title: "Testing", detail: "Testing Details", image: Asset.OnBoarding.Intro.logo1.image, index: 0)
}
