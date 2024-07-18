//
//  AIInsightsExpenseBar.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 03/07/2024.
//

import SwiftUI

struct AIInsightsExpenseBar: View {
    
    var progress: CGFloat
    var totalExpense: Int
    var title: String
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .trim(from: 0.0, to: 0.75)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 22, lineCap: .square))
                .rotationEffect(Angle(degrees: 135))
                .frame(width: 160, height: 160)
            
            Circle()
                .trim(from: 0.0, to: (progress * 0.75))
                .stroke(Color.white, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(Angle(degrees: 135))
                .frame(width: 160, height: 160)
                .animation(.easeInOut(duration: 1.0))
            
            VStack(spacing: 10) {
                Text(title)
                    .font(Font.SFPro.regular(size: 18))
                Text("$\(totalExpense)")
                    .font(Font.SFPro.bold(size: 18))
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    AIInsightsExpenseBar(progress: 0.75, totalExpense: 15000, title: "Expense")
}
