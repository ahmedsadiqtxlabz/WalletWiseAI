//
//  Publisher+FormValidators.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 05/06/2024.
//

import Foundation
import Combine

extension Publisher where Self.Output == String, Self.Failure == Never {

  // TODO: pull in password valid code
  var passwordValid: AnyPublisher<Bool, Never> {
    self.isNotEmpty()
  }

  var emailValid: AnyPublisher<Bool, Never> {
    self.map { $0.isValidEmail() }.eraseToAnyPublisher()
  }
}
