//
//  SignUpViewModel.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 05/06/2024.
//

import Foundation
import Combine
import SwiftUI

class SignUpViewModel: ObservableObject {
    private var disposables = Subscriptions()
    
    @Published var email = ""
    @Published var fullName = ""
    @Published var password = ""
    @Published var showMessage = false
    @Published var isLoading = false
    @Published var goToNext = false
    @Published var errorMessage: String = "" {
        didSet {
            showMessage = errorMessage != "" ? true : false
        }
    }
    
    init() {}
    
    func isValid() -> Bool {
        guard !self.fullName.isEmpty else {
            self.errorMessage = L10n.Onboarding.Validations.fullName
            return false
        }
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
        guard password.count >= 8 else {
            self.errorMessage = L10n.Onboarding.Validations.invalidPassword
            return false
        }
        return true
    }
    
    func signUp() {
        self.isLoading = true
        SystemServices.authentication.signUp(email: email, name: fullName, password: password)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { user in
                DefaultsService.user = user
                self.goToNext = true
            })
            .store(in: &disposables)
    }
    
    func signupGoogle() {
        self.isLoading = true
        SystemServices.authentication.signInWithGoogle()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { user in
                DefaultsService.user = user
                self.goToNext = true
            })
            .store(in: &disposables)
    }
    
    func signUpApple() {
        self.isLoading = true
        SystemServices.authentication.signInWithApple()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { user in
                DefaultsService.user = user
                self.goToNext = true
            })
            .store(in: &disposables)
    }
}
