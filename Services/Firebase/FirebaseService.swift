//
//  FirebaseService.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 06/06/2024.
//

import Foundation
import Firebase

final class FirebaseService: NSObject, ObservableObject {
    func initialiseFirebase() {
        FirebaseApp.configure()
    }
}
