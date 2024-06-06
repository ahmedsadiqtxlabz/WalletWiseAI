//
//  String+EmailRegex.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 05/06/2024.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
