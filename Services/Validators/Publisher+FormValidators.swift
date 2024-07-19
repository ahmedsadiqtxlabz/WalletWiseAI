//
//  Publisher+FormValidators.swift
//  WalletWiseAI
//
//  Created by Muhammad Arslan on 05/06/2024.
//

import Foundation
import Combine

extension Publisher where Self.Output == String, Self.Failure == Never {
    
    var passwordValid: AnyPublisher<Bool, Never> {
        self.isNotEmpty()
    }
    
    var emailValid: AnyPublisher<Bool, Never> {
        self.map { $0.isValidEmail() }.eraseToAnyPublisher()
    }
}
