//
//  BudgetView.swift
//  WalletWiseAI
//
//  Created by Muhammad Arslan on 08/05/2024.
//

import SwiftUI

struct BudgetView: View {
    var body: some View {
        VStack {
            headerView
            BudgetBarChartView()
            BudgetPieChartView()
            Spacer()
        }
        .padding(EdgeInsets(top: 60, leading: 0, bottom: 85, trailing: 0))
        .background(Color(Asset.Colors.primaryLightGray.color))
        .edgesIgnoringSafeArea(.all)
    }
}

extension BudgetView {
    
    var headerView: some View {
        HStack {
            Spacer()
            Text(L10n.Budget.title)
                .foregroundColor(.black)
                .font(Font.SFPro.semiBold(size: 18))
            Spacer()
        }
    }
}

#Preview {
    BudgetView()
}
