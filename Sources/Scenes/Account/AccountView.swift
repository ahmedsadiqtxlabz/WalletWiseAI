//
//  AccountView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 08/05/2024.
//

import SwiftUI

struct AccountView: View {
    struct Option {
        let icon: UIImage
        let title: String
    }
    
    @State var progress: CGFloat = 0.7
    @State var goToTransactions: Bool = false
    
    let options: [Option] = [
        Option(icon: Asset.Accounts.transactionHistoryIcon.image, title: L10n.Accounts.Options.history),
        Option(icon: Asset.Accounts.premiumPlanIcon.image, title: L10n.Accounts.Options.plans)
    ]
    
    var body: some View {
        NavStackHandler {
            VStack(alignment: .center, spacing: 5) {
                headerView
                userView
                optionsView
                links
            }
            .padding(.top, 60)
            .background(Color(Asset.Colors.primaryLightGray.color))
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    var headerView: some View {
        ZStack {
            HStack {
                Spacer()
                Button(action: {
                }, label: {
                    Image(uiImage: Asset.Accounts.settingsIcon.image)
                })
                .padding(.trailing, 20)
            }
            
            Text(L10n.Accounts.title)
                .font(Font.SFPro.semiBold(size: 18))
        }
    }
    
    var userView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.accountBlue.color))
                .cornerRadius(10, corners: .allCorners)
            VStack(alignment: .center) {
                userNameAndImage
                progressView
                moneyView
            }
        }
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
    }
    var optionsView: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading) {
                ForEach(options, id: \.title) { option in
                    AccountsRow(icon: option.icon, title: option.title)
                        .onTapGesture {
                            self.goToTransactions = true
                        }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
    }
}

extension AccountView {
    var userNameAndImage: some View {
        VStack(alignment: .center, spacing: 15) {
            Image(uiImage: Asset.Home.userPlaceholder.image)
                .resizable()
                .frame(width: 100, height: 100)
            Text("John Smith")
                .font(Font.SFPro.medium(size: 16))
        }
        .padding(.top, 20)
    }
    var progressView: some View {
        VStack(alignment: .center, spacing: 7) {
            HStack(alignment: .center) {
                Text(L10n.Accounts.budgetTitle)
                    .font(Font.SFPro.regular(size: 15))
                    .foregroundColor(.gray)
                Spacer()
            }
            CustomProgressView(progress: progress)
                .frame(height: 10)
            HStack(alignment: .center) {
                Text("$38,000/70%")
                    .foregroundColor(.gray)
                    .font(Font.SFPro.regular(size: 15))
                Spacer()
                Text("$50,000")
                    .foregroundColor(.gray)
                    .font(Font.SFPro.regular(size: 15))
            }
        }
        .padding()
    }
    var moneyView: some View {
        HStack(spacing: 20) {
            incomeView
            expenseView
        }
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
    }
    var incomeView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryWhite.color))
                .cornerRadius(10, corners: .allCorners)
            VStack(spacing: 10) {
                HStack{
                    Text(L10n.Accounts.income)
                        .font(Font.SFPro.regular(size: 17))
                    Spacer()
                }
                HStack{
                    Text("$1300.00")
                        .font(Font.SFPro.bold(size: 23))
                    Spacer()
                }
                
            }
            .padding()
        }
    }
    var expenseView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryWhite.color))
                .cornerRadius(10, corners: .allCorners)
            VStack(spacing: 10) {
                HStack{
                    Text(L10n.Accounts.expenses)
                        .font(Font.SFPro.regular(size: 17))
                    Spacer()
                }
                HStack{
                    Text("$1600.00")
                        .font(Font.SFPro.bold(size: 23))
                    Spacer()
                }
            }
            .padding()
        }
    }
    
    var links: some View {
            NavigationLink(destination: TransactionsHistoryView(), isActive: self.$goToTransactions) { EmptyView() }
                .isDetailLink(false)
    }
}

#Preview {
    AccountView()
}
