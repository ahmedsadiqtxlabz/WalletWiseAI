//
//  AccountsRow.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 12/06/2024.
//

import SwiftUI

struct AccountsRow: View {
    
    var icon: UIImage
    var title: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryWhite.color))
            HStack {
                Image(uiImage: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                Text(title)
                    .foregroundColor(Color(Asset.Colors.heading.color))
                    .font(Font.SFPro.semiBold(size: 18))
                    .padding(.leading, 5)
                Spacer()
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
    AccountsRow(icon: Asset.Accounts.transactionHistoryIcon.image, title: L10n.Accounts.Options.history)
}
