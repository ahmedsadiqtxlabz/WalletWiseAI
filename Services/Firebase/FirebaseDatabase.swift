//
//  FirebaseDatabase.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 10/07/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseCore

final class FirebaseDatabase: NSObject, ObservableObject {
    
    private enum Keys: String {
        case users
    }
    
    class func getUser(id: String, _ success: @escaping (User) -> Void, _ failure: @escaping (Error) -> Void) {
        Firestore.firestore().collection(Keys.users.rawValue).document(id).getDocument { document, error in
            if let error = error {
                print("Error getting document: \(error)")
                failure(error)
            } else if let document = document, document.exists, let data = document.data() {
                let user = User(data: data)
                success(user)
            } else {
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "user not found"])
                    failure(error)
            }
        }
    }
    
    class func saveUser(id: String, user: User, success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        let encodeUser = user.encode()
        Task {
            do {
                try await Firestore.firestore().collection("users").document(id).setData(encodeUser)
                success()
            } catch {
                failure(error)
            }
        }
    }
}
