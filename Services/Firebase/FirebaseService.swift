//
//  FirebaseService.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 04/06/2024.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import Combine

final class FirebaseService: NSObject, ObservableObject {
    
    func initialiseFirebase() {
      FirebaseApp.configure()
    }
}
