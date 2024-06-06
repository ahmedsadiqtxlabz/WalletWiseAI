//
//  SignInViewModel.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 05/06/2024.
//

import Foundation
import Combine

class SignInViewModel: ObservableObject {
    private var disposables = Subscriptions()
    
    @Published var email = ""
    @Published var password = ""
    @Published var showMessage: Bool = false
    @Published var errorMessage: String = "" {
        didSet {
            showMessage = errorMessage != "" ? true : false
        }
    }
    
    init() {}
    
    func isValid() -> Bool {
        guard !email.isEmpty else {
            self.errorMessage = L10n.Onboarding.Validations.emptyEmail
            return false
        }
        guard email.isValidEmail() else {
            self.errorMessage = L10n.Onboarding.Validations.invalidEmail
            return false
        }
        guard !password.isEmpty else {
            self.errorMessage = L10n.Onboarding.Validations.emptyPassword
            return false
        }
        return true
    }
    
}
