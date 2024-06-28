//
//  WalletWiseCurrencyTextField.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 26/06/2024.
//

import SwiftUI

struct WalletWiseCurrencyTextField: View {
    
    @State private var text: String = ""
    @Binding var amount: Double
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .font(Font.SFPro.regular(size: 17))
            .keyboardType(.decimalPad)
            .padding()
            .background(Color(Asset.Colors.primaryWhite.color))
            .cornerRadius(10)
            .onChange(of: text, perform: { value in
                text = formatCurrency(value) ?? ""
                if value.last == "." {
                    text.append(".")
                } else if value.contains(".") && value.last == "0" {
                    text.append(".0")
                }
            })
    }
    
    private func formatCurrency(_ value: String) -> String? {
        let filtered = value.filter { "0123456789.".contains($0) }
        if let doubleValue = Double(filtered) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 2
            formatter.currencySymbol = "$"
            return formatter.string(from: NSNumber(value: doubleValue))
        }
        return nil
    }
}

#Preview {
    WalletWiseCurrencyTextField(amount: Binding.constant(0.0), placeholder: "")
}
