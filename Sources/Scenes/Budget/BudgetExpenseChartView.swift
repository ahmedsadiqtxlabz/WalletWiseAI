//
//  BudgetExpenseChartView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 09/07/2024.
//

import SwiftUI

struct BudgetExpenseChartView: View {
    @State var choice = "Monthly"
    var options = ["Daily", "Monthly", "Yearly"]

    var body: some View {
        VStack {
            picker
        }
        .padding(10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)))
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }

    var picker: some View {
        HStack(spacing: 10) {
            ForEach(options, id: \.self) { option in
                Button {
                    choice = option
                } label: {
                    Text(option)
                        .font(.caption)
                        .foregroundColor(choice == option ? Color.white : Color.gray)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(choice == option ? Color.blue : Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)))
                }

            }
        }
    }
}
#Preview {
    BudgetExpenseChartView()
}
