//
//  DatePickerView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 20/06/2024.
//

import Foundation
import SwiftUI

struct DatePickerView: View {
    @Binding var date: Date
    var onClose: () -> Void

    var body: some View {
        ZStack(alignment: .center) {
            Color.black.opacity(0.7)
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryWhite.color))
                .cornerRadius(10)
                .frame(height: 400)
                .padding()
            VStack {
                Spacer()
                HStack(alignment: .center) {
                    Spacer()
                    Button(action: onClose, label: {
                        Text(L10n.Global.done)
                            .font(Font.SFPro.semiBold(size: 16))
                            .foregroundColor(Color(Asset.Colors.primaryBlue.color))
                            .padding()
                    })
                }
                .frame(height: 10)
                DatePicker("", selection: $date, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .labelsHidden()
                Spacer()
            }
            .padding()
        }
    }
}
