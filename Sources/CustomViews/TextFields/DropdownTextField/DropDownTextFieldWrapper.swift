//
//  DropDownTextFieldWrapper.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 28/06/2024.
//

import SwiftUI

struct DropDownTextFieldWrapper: UIViewRepresentable {
    class Coordinator: NSObject, DropDownTextFieldDelegate {
        var parent: DropDownTextFieldWrapper

        init(parent: DropDownTextFieldWrapper) {
            self.parent = parent
        }

        func dropdown(textField: DropDownTextField, selectedItem: String) {
            parent.selectedItem = selectedItem
        }
    }

    @Binding var selectedItem: String
    var itemsList: [String]
    var isImageDropDown: Bool = false
    var placeholder: String

    func makeUIView(context: Context) -> DropDownTextField {
        let textField = DropDownTextField()
        textField.ddDelegate = context.coordinator
        textField.isImageDropDown = isImageDropDown
        textField.placeholder = placeholder
        textField.tintColor = .clear
        textField.font = UIFont(name: "SFProText-Regular", size: 17)
        textField.setItemList(list: itemsList)
        return textField
    }

    func updateUIView(_ uiView: DropDownTextField, context: Context) {
        uiView.text = selectedItem
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}
