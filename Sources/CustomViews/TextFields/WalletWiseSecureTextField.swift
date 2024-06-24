//
//  WalletWiseSecureTextField.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 03/05/2024.
//

import SwiftUI

struct WalletWiseSecureTextField: View {
    @Binding var text: String
    @State var placeholder = ""
        let leadingImage: UIImage
        let keyboardType: UIKeyboardType
        
        var body: some View {
            HStack(alignment: .center, spacing: 5) {
                Image(uiImage: leadingImage)
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                    .frame(height: 45)
                
                SecureField(placeholder, text: $text)
                    .padding(8)
                    .padding(.trailing, 10)
                    .keyboardType(keyboardType)
                    .font(Font.SFPro.regular(size: 16))
                    .frame(height: 45)
            }
            .background(Color(Asset.Colors.primaryWhite.color))
            .cornerRadius(10, corners: .allCorners)
        }
}
