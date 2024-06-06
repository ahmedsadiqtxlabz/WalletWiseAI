//
//  MessageView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 04/06/2024.
//

import SwiftUI

struct MessageView: View {
    
    @Binding var showMessage: Bool
    
    var message: String
    var isError: Bool
    
    var body: some View {

        Capsule(style: .continuous)
            .fill(isError == true ? Color.red : Color(Asset.Colors.primaryBlue.color))
            .frame(height: 45.0)
            .padding(.horizontal, 20.0)
            .transition(.opacity)
            .overlay(
                HStack {
                    Image(systemName: isError == true ? "exclamationmark.circle" : "checkmark.circle")
                        .foregroundColor(.white)
                        .padding(.leading, 25.0)
                    Text("\(message)")
                        .font(Font.SFPro.regular(size: 15.0))
                        .foregroundColor(.white)
                        .padding(.trailing, 25.0)
                }
            )
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
                    self.showMessage = false
            })
        })
    }

}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(showMessage: .constant(true), message: "Message", isError: false)
    }
}

