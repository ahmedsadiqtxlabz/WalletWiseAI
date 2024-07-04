//
//  AIInsightsView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 08/05/2024.
//

import SwiftUI

struct AIInsightsView: View {
    struct Category {
        let icon: UIImage
        let title: String
    }
    
    let categories: [Category] = [
        Category(icon: Asset.Categories.foodIcon.image, title: "Food"),
        Category(icon: Asset.Categories.shoppingIcon.image, title: "Shopping"),
        Category(icon: Asset.Categories.entertainmentIcon.image, title: "Entertainment"),
        Category(icon: Asset.Categories.fuelIcon.image, title: "Fuel"),
        Category(icon: Asset.Categories.fuelIcon.image, title: "Fuel")
    ]
    
    @State var goToTransaction: Bool = false
    @State var goToRecomendation: Bool = false
    
    var body: some View {
        NavStackHandler {
            ZStack {
                VStack(alignment: .center, spacing: 20) {
                    headerView
                    ScrollView(.vertical, showsIndicators: false) {
                        categoriesView
                        expenseView
                        Spacer(minLength: 20)
                        recommendationsView
                    }
                }
                links
            }
            .padding(EdgeInsets(top: 60, leading: 0, bottom: 85, trailing: 0))
            .background(Color(Asset.Colors.primaryLightGray.color))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

extension AIInsightsView {
    
    var headerView: some View {
        HStack {
            Spacer()
            Text(L10n.Insights.title)
                .foregroundColor(.black)
                .font(Font.SFPro.semiBold(size: 18))
            Spacer()
        }
    }
    
    var categoriesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(categories, id: \.title) { category in
                    AIInsightsCategoryView(title: category.title, icon: category.icon)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        }
        .frame(height: 90)
    }
    
    var expenseView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryWhite.color))
                .cornerRadius(10, corners: .allCorners)
            VStack {
                AIInsightsExpenseBar(progress: 0.75, totalExpense: 15000, title: L10n.Global.expense)
            }
            .padding(.top, 20)
        }
        .frame(height: 200)
        .padding(EdgeInsets(top: 30, leading: 15, bottom: 0, trailing: 15))
    }
    
    var recommendationsView: some View {
        Section {
            LazyVStack(alignment: .leading) {
                ForEach(0..<10, id: \.self) { _ in
                    AIInsightsTransactionView(goToRecomentation: $goToRecomendation, goToTransactionDetails: $goToTransaction)
                }
            }
            .padding(.horizontal, 10)
        }
    }
    
    var links: some View {
        Group {
            NavigationLink(destination: TransactionDetailsView(), isActive: self.$goToTransaction) { EmptyView() }
                .isDetailLink(false)
            NavigationLink(destination: AIRecommendationsView(), isActive: self.$goToRecomendation) { EmptyView() }
                .isDetailLink(false)
        }
    }
    
}

#Preview {
    AIInsightsView()
}
