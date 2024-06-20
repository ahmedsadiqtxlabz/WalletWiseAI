//
//  TransactionRow.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 10/05/2024.
//

import SwiftUI

struct TransactionRow: View {
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryWhite.color))
            HStack(alignment: .center, spacing: 10) {
                Image(uiImage: Asset.Home.transactionLogo.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                VStack(alignment: .leading, spacing:  5) {
                    Text("Uber")
                        .foregroundColor(Color(Asset.Colors.heading.color))
                        .font(Font.SFPro.semiBold(size: 20))
                    Text("25/4/2024")
                        .foregroundColor(Color(Asset.Colors.subheading.color))
                        .font(Font.SFPro.regular(size: 15))
                }
                Spacer()
                Text("-20%")
                    .foregroundColor(Color(Asset.Colors.heading.color))
                    .font(Font.SFPro.semiBold(size: 20))
                    .padding(.trailing, 10)
                Image(uiImage: Asset.forwardArrow.image)
            }
            .padding()
        }
        .cornerRadius(10, corners: .allCorners)
        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        .shadow(color: Color.gray.opacity(0.4), radius: 5)
    }
}

#Preview {
    TransactionRow()
}
