//
//  NotificationsView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 26/06/2024.
//

import SwiftUI

struct NotificationsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            headerView
            Spacer()
        }
        .padding(.top, 60)
        .background(Color(Asset.Colors.primaryLightGray.color))
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

extension NotificationsView {
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
            
            Text(L10n.Notifications.title)
                .font(Font.SFPro.semiBold(size: 18))
        }
    }
}

#Preview {
    NotificationsView()
}
