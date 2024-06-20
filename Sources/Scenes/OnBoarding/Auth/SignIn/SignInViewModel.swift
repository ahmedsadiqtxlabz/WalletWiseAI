//
//  SignInViewModel.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 05/06/2024.
//

import Foundation
import Combine
import SwiftUI

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
    
    func signIn() {
        SystemServices.authentication.signIn(email: email, password: password)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Success")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { name in
                print(name)
            })
            .store(in: &disposables)
    }
    
    func signInGoogle() {
        SystemServices.authentication.signInWithGoogle()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Success")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { _ in
                print("Google Sign in")
            })
            .store(in: &disposables)
    }
}
