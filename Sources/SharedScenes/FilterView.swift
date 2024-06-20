//
//  FilterView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 12/06/2024.
//

import SwiftUI

struct FilterView: View {
    @Binding var isPresented: Bool
    @Binding var fromDate: Date
    @Binding var toDate: Date
    @Binding var showFromDatePicker: Bool
    @Binding var showToDatePicker: Bool
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryWhite.color))
                .cornerRadius(25, corners: [.topLeft, .topRight])
            VStack(spacing: 0) {
                barView
                fromDateView
                toDateView
                applyButton
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .frame(height: 330)
    }
}

extension FilterView {
    var barView: some View {
        Rectangle()
            .foregroundColor(Color(red: 236/255, green: 236/255, blue: 236/255))
            .frame(width: 50, height: 7, alignment: .center)
            .cornerRadius(3.5, corners: .allCorners)
            .padding(.top, 10)
    }
    var fromDateView: some View {
        VStack {
            HStack {
                Text(L10n.Transactions.Filters.from)
                    .font(Font.SFPro.medium(size: 16))
                Spacer()
            }
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 236/255, green: 236/255, blue: 236/255))
                    .cornerRadius(10, corners: .allCorners)
                    .frame(height: 45)
                HStack {
                    Text(DateFormattingHelper.shared.filtersDateFormatter.string(from: fromDate))
                        .font(Font.SFPro.medium(size: 16))
                    Spacer()
                    Image(uiImage: Asset.calendar.image)
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
            .onTapGesture {
                self.showFromDatePicker = true
            }
        }
        .padding(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15))
    }
    
    var toDateView: some View {
        VStack {
            HStack {
                Text(L10n.Transactions.Filters.to)
                    .font(Font.SFPro.medium(size: 16))
                Spacer()
            }
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 236/255, green: 236/255, blue: 236/255))
                    .cornerRadius(10, corners: .allCorners)
                    .frame(height: 45)
                HStack {
                    Text(DateFormattingHelper.shared.filtersDateFormatter.string(from: fromDate))
                        .font(Font.SFPro.medium(size: 16))
                    Spacer()
                    Image(uiImage: Asset.calendar.image)
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
            .onTapGesture {
                self.showToDatePicker = true
            }
        }
        .padding(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15))
    }
    
    var applyButton: some View {
        Button(action: {
            print("Apply Button Pressed")
        }, label: {
            Text(L10n.Transactions.Filters.buttonTitle)
                .modifier(BlueButtonStyle(state: .enabled))
                .font(Font.SFPro.semiBold(size: 17))
                .padding(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15))
        })
    }
}

#Preview {
    FilterView(
        isPresented: Binding.constant(false),
        fromDate: Binding.constant(Date()),
        toDate: Binding.constant(Date()),
        showFromDatePicker: Binding.constant(false),
        showToDatePicker: Binding.constant(false))
}
