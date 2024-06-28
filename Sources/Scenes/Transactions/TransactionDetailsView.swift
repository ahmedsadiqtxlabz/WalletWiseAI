//
//  TransactionDetailsView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 24/06/2024.
//

import SwiftUI

struct TransactionDetailsView: View {
    struct DetailsData {
        let title: String
        let value: String
    }
    
    @Environment(\.presentationMode) var presentationMode
    let data: [DetailsData] = [
        DetailsData(title: "Date & Time", value: "24/4/2024 04:00 PM"),
        DetailsData(title: "Paid with", value: "Apple Pay"),
        DetailsData(title: "Category", value: "Shopping")
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            headerView
            transactionView
            detailsView
            Spacer()
        }
        .background(Color(Asset.Colors.primaryLightGray.color))
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

extension TransactionDetailsView {
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
            
            Text(L10n.Transactions.Details.title)
                .font(Font.SFPro.semiBold(size: 18))
        }
        .padding(.top, 60)
    }
    
    var transactionView: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(uiImage: Asset.Home.transactionLogo.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
            Text("Save 10%")
                .foregroundColor(.black)
                .font(Font.SFPro.semiBold(size: 22))
        }
    }
    
    var detailsView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryWhite.color))
                .cornerRadius(10, corners: .allCorners)
            VStack(alignment: .center, spacing: 10) {
                HStack {
                    Text(L10n.Transactions.Details.detailsViewTitle)
                        .font(Font.SFPro.medium(size: 16))
                    Spacer()
                }
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(Color(Asset.Colors.subheading.color))
                detailsDataView
                    .padding(.top, 15)
                Spacer()
            }
            .padding()
        }
        .frame(height: 180)
        .padding()
    }
    
    var detailsDataView: some View {
        ForEach(data, id: \.title) { data in
            DetailsDataView(title: data.title, value: data.value) 
        }
    }
}

fileprivate struct DetailsDataView: View {
    var title: String
    var value: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Color(Asset.Colors.subheading.color))
                .font(Font.SFPro.medium(size: 15))
            Spacer()
            Text(value)
                .foregroundColor(Color(Asset.Colors.subheading.color))
                .font(Font.SFPro.regular(size: 15))
        }
    }
}

#Preview {
    TransactionDetailsView()
}
