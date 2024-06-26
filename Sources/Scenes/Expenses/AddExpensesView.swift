//
//  AddExpensesView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 24/06/2024.
//

import SwiftUI

struct AddExpensesView: View {
    @Binding var isPresented: Bool
    var body: some View {
        ZStack {
            Color(Asset.Colors.primaryLightGray.color)
            VStack(alignment: .center, spacing: 30) {
                headerView
                formView
                buttonsView
                Spacer()
            }
            .padding(.top, 25)
        }
        .background(Color(Asset.Colors.primaryLightGray.color))
        .edgesIgnoringSafeArea(.all)
        
    }
}

extension AddExpensesView {
    var headerView: some View {
        HStack {
            Text(L10n.Expenses.title)
                .foregroundColor(.black)
                .font(Font.SFPro.semiBold(size: 18))
        }
    }
    
    var formView: some View {
        VStack(alignment: .center, spacing: 15) {
            
        }
    }
    
    var buttonsView: some View {
        HStack(alignment: .center, spacing: 15) {
            Button(action: {
                self.isPresented = false
            }, label: {
                Text(L10n.Global.cancel)
                    .font(Font.SFPro.semiBold(size: 17))
                    .modifier(BorderButtonStyle(
                        state: .enabled,
                        strokeColor: Color(Asset.Colors.primaryBlue.color),
                        color: Color(Asset.Colors.primaryBlue.color)))
            })
            Button(action: {
                
            }, label: {
                Text(L10n.Expenses.title)
                    .font(Font.SFPro.semiBold(size: 17))
                    .modifier(BlueButtonStyle(state: .enabled))
            })
        }
        .padding()
    }
}

#Preview {
    AddExpensesView(isPresented: Binding.constant(false))
}
