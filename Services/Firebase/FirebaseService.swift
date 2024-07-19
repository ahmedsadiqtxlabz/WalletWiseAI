//
//  FirebaseService.swift
//  WalletWiseAI
//
//  Created by Muhammad Arslan on 06/06/2024.
//

import Foundation
import Firebase

final class FirebaseService: NSObject, ObservableObject {
    func initialiseFirebase() {
        FirebaseApp.configure()
    }
}
