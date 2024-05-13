//
//  HomeView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 08/05/2024.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack(alignment:.center) {
            Color(Asset.Colors.primaryLightGray.color)
            VStack(alignment: .center, spacing: 15) {
                topUserView
                lineView
                totalBalanceView
                availableFundsView
                summaryView
                recentTransactionsView
            }
            .padding(EdgeInsets(top: 55, leading: 0, bottom: 1, trailing: 0))
        }
        .edgesIgnoringSafeArea([.top, .leading, .trailing])
    }
    
    var topUserView: some View {
        HStack(alignment: .center) {
            Image(uiImage: Asset.Home.userPlaceholder.image)
            Text("Welcome John!")
                .font(Font.SFPro.medium(size: 19))
                .foregroundColor(Color(Asset.Colors.heading.color))
            Spacer()
            Button(action: {
                
            }, label: {
                Image(uiImage: Asset.Home.notificationIcon.image)
            })
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
    var lineView: some View {
        Rectangle()
            .foregroundColor(.gray)
            .frame(height: 0.5)
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
    }
    var totalBalanceView: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(L10n.Home.totalBalance)
                    .font(Font.SFPro.regular(size: 18))
                    .foregroundColor(Color(Asset.Colors.subheading.color))
                Spacer()
            }
            HStack {
                Text("$13,050.00")
                    .font(Font.SFPro.bold(size: 30))
                    .foregroundColor(Color(Asset.Colors.heading.color))
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
    }
    
    var availableFundsView: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(L10n.Home.availableFunds)
                    .font(Font.SFPro.regular(size: 16))
                    .foregroundColor(Color(Asset.Colors.subheading.color))
                Spacer()
            }
            HStack {
                Text("$13,050.00")
                    .font(Font.SFPro.bold(size: 22))
                    .foregroundColor(Color(Asset.Colors.heading.color))
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
    
    var summaryView: some View {
        VStack(alignment: .center, spacing: 15) {
            HStack(alignment: .center) {
                Text(L10n.Home.summaryTitle)
                    .font(Font.SFPro.bold(size: 18))
                    .foregroundColor(Color(Asset.Colors.heading.color))
                Spacer()
            }
            HStack(alignment: .center, spacing: 15) {
                summaryExpensesView
                summaryIncomeView
            }
            .frame(height: 120)
        }
        .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
    }
    
    var summaryExpensesView: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryBlue.color.withAlphaComponent(0.12)))
                .cornerRadius(8, corners: .allCorners)
            VStack(alignment: .center, spacing: 15) {
                HStack(alignment: .center, spacing: 10) {
                    Image(uiImage: Asset.Home.homeExpenseIcon.image)
                    Text(L10n.Home.summaryExpenses)
                        .font(Font.SFPro.regular(size: 16))
                        .foregroundColor(Color(Asset.Colors.heading.color))
                    Spacer()
                }
                HStack(alignment: .center) {
                    Text("$13085.00")
                        .font(Font.SFPro.semiBold(size: 23))
                    Spacer()
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 30, leading: 15, bottom: 0, trailing: 15))
        }
    }
    
    var summaryIncomeView: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryBlue.color.withAlphaComponent(0.12)))
                .cornerRadius(8, corners: .allCorners)
            VStack(alignment: .center, spacing: 15) {
                HStack(alignment: .center, spacing: 10) {
                    Image(uiImage: Asset.Home.homeIncomeIcon.image)
                    Text(L10n.Home.summaryIncome)
                        .font(Font.SFPro.regular(size: 16))
                        .foregroundColor(Color(Asset.Colors.heading.color))
                    Spacer()
                }
                HStack(alignment: .center) {
                    Text("$13085.00")
                        .font(Font.SFPro.semiBold(size: 23))
                    Spacer()
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 30, leading: 15, bottom: 0, trailing: 15))
        }
    }
    
    var recentTransactionsView: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack {
                Text(L10n.Home.recentTransactions)
                    .foregroundColor(Color(Asset.Colors.heading.color))
                    .font(Font.SFPro.bold(size: 18))
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading) {
                    ForEach(0..<5, id: \.self) { _ in
                        TransactionRow()
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        }
    }
    
    var transactions: some View {
        Section {
            ForEach(0..<5, id: \.self) { _ in
                TransactionRow()
                    .listRowInsets(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                    .listRowBackground(Color(Asset.Colors.primaryLightGray.color))
            }
        }
    }
}

#Preview {
    HomeView()
}
