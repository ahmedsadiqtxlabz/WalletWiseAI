//
//  WalletWiseTextView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 27/06/2024.
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
    
    // Step 2: Create the UITextView
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = UIFont(name: "SFProText-Regular", size: 17)
        textView.delegate = context.coordinator
        textView.backgroundColor = .clear
        textView.autocapitalizationType = .sentences
        return textView
    }
    
    // Step 3: Update the UITextView
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
