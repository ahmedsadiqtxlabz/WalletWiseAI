//
//  BudgetBarChartView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 09/07/2024.
//

import SwiftUI

struct BarData: Identifiable {
    var id: String {
        name
    }
    
    let color: Color
    let value: Int
    let name: String
}

struct BudgetBarChartView: View {
    let incomeData = BarData(color: .green, value: 3000, name: "Income")
    let expenseData = BarData(color: .pink, value: 1000, name: "Expenses")
    let remainingData = BarData(color: .purple, value: 2000, name: "Remaining")
    let maxBarHeight: Double = 120
    
    var expenseHeight: Double {
        let ratio = Double(expenseData.value) / Double(incomeData.value)
        return maxBarHeight * ratio
    }
    
    var remainingHeight: Double {
        let ratio = Double(remainingData.value) / Double(incomeData.value)
        return maxBarHeight * ratio
    }
    
    var body: some View {
        HStack(alignment: .bottom, spacing: .zero) {
            barView(for: incomeData, height: maxBarHeight)
            Spacer()
            barView(for: expenseData, height: expenseHeight)
            Spacer()
            barView(for: remainingData, height: remainingHeight)
        }
        .padding(10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)))
        .padding([.horizontal, .top], 16)
    }
    
    func barView(for data: BarData, height: Double) -> some View {
        VStack(spacing: 5) {
            Rectangle()
                .fill(data.color)
                .frame(width: 35, height: height)
                .cornerRadius(5, corners: [.topLeft, .topRight])
                .padding(.bottom, 8)
            
            Text("$\(data.value)")
                .font(.caption)
            
            Text(data.name)
                .font(Font.SFPro.regular(size: 13))
                .foregroundColor(Color.gray)
        }
    }
}

#Preview {
    BudgetBarChartView()
}
