//
//  WalletWiseTextView.swift
//  WalletWiseAI
//
//  Created by Muhammad Arslan on 27/06/2024.
//

import UIKit
import SwiftUI

struct WalletWiseTextView: UIViewRepresentable {
    
    @Binding var text: String
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: WalletWiseTextView
        
        init(_ parent: WalletWiseTextView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = UIFont(name: "SFProText-Regular", size: 17)
        textView.delegate = context.coordinator
        textView.backgroundColor = .clear
        textView.autocapitalizationType = .sentences
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
