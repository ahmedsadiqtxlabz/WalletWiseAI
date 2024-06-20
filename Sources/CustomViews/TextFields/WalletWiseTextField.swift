//
//  WalletWiseTextField.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 03/05/2024.
//

import SwiftUI

struct WalletWiseTextField: View {
    @Binding var text: String
    @State var placeholder = ""
    let leadingImage: UIImage
    let keyboardType: UIKeyboardType
    let capitalization: UITextAutocapitalizationType
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Image(uiImage: leadingImage)
                .foregroundColor(.gray)
                .padding(.leading, 10)
                .frame(height: 45)
            
            TextField(placeholder, text: $text)
                .autocapitalization(capitalization)
                .padding(8)
                .padding(.trailing, 10)
                .keyboardType(keyboardType)
                .font(Font.SFPro.regular(size: 16))
                .frame(height: 45)
            
        }
        .background(Color(Asset.Colors.primaryWhite.color))
        .cornerRadius(10)
    }
}
