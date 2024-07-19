//
//  Publisher+CollectionValidators.swift
//  WalletWiseAI
//
//  Created by Muhammad Arslan on 05/06/2024.
//

import Foundation
import Combine

extension Publisher where Self.Output: Collection, Self.Output: Equatable {
    
    func isNotEmpty() -> AnyPublisher<Bool, Self.Failure> {
        map {
            !$0.isEmpty
        }
        .eraseToAnyPublisher()
    }
    
    func minimumCount(_ count: Int) -> AnyPublisher<Bool, Self.Failure> {
      map {
        $0.count >= count
      }
      .eraseToAnyPublisher()
    }
}
