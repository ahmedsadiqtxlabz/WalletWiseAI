//
//  AddExpensesView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 24/06/2024.
//

import SwiftUI

struct AddExpensesView: View {
    
    @Binding var isPresented: Bool
    @State private var showImagePicker: Bool = false
    @State private var showDatePicker: Bool = false
    @State var amount: Double = 0.0
    @State private var Images: [UIImage] = []
    @State private var note: String = ""
    @State private var category: String = ""
    @State private var date: Date = Date()
    private let itemsList = ["Shopping", "Food", "Travel"]
    
    var body: some View {
        ZStack {
            Color(Asset.Colors.primaryLightGray.color)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 25) {
                    headerView
                    formView
                    noteView
                    buttonsView
                    Spacer()
                }
                .padding(.top, 25)
            }
            if self.showDatePicker {
                DatePickerView(date: $date) {
                    self.showDatePicker = false
                }
            }
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
        VStack(alignment: .center, spacing: 25) {
            WalletWiseCurrencyTextField(
                amount: $amount,
                placeholder: L10n.Expenses.Placeholders.amount)
            dateView
            categoryDropDownView
        }
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
    
    var categoryDropDownView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryWhite.color))
                .cornerRadius(10, corners: .allCorners)
            HStack {
                Spacer()
                Image(uiImage: Asset.downArrow.image)
            }
            .padding(.trailing, 15)
            DropDownTextFieldWrapper(selectedItem: $category, itemsList: itemsList, placeholder: L10n.Expenses.Placeholders.category)
                .padding(.leading, 15)
        }
        .frame(height: 55)
    }
    
    var dateView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryWhite.color))
                .cornerRadius(10, corners: .allCorners)
                .frame(height: 55)
            HStack {
                Text(DateFormattingHelper.shared.filtersDateFormatter.string(from: date))
                    .font(Font.SFPro.regular(size: 17))
                Spacer()
                Image(uiImage: Asset.calendar.image)
            }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 10))
        }
        .onTapGesture {
            self.showDatePicker = true
        }
    }
    
    var noteView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryWhite.color))
                .cornerRadius(10, corners: .allCorners)
            VStack {
                noteTextView
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(height: 0.3)
                    .foregroundColor(.gray)
                ImagePickerView(images: $Images, sourceType: .photoLibrary)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        .frame(height: 200)
    }
    
    var noteTextView: some View {
        ZStack {
            if note.isEmpty {
                VStack {
                    HStack {
                        Text(L10n.Expenses.Placeholders.note)
                            .padding(EdgeInsets(top: 18, leading: 15, bottom: 0, trailing: 10))
                            .font(Font.SFPro.regular(size: 17))
                            .foregroundColor(Color(Asset.Colors.placeholder.color))
                        Spacer()
                    }
                    Spacer()
                }
            }
            WalletWiseTextView(text: $note)
                .padding(.all, 10)
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
                self.showImagePicker = true
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
