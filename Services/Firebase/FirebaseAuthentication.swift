//
//  FirebaseService.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 04/06/2024.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import GoogleSignIn
import Combine

final class FirebaseAuthentication: NSObject, ObservableObject {
    
    func signUp(email: String, name: String, password: String) -> AnyPublisher<Void, Error> {
        Future<Void, Error> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                
                guard let user = result?.user else {
                    promise(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User creation failed."])))
                    return
                }
                let db = Firestore.firestore()
                Task {
                    do {
                        try await db.collection("users").document(user.uid).setData([
                            "name": name,
                            "email": email
                        ])
                        promise(.success(()))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signIn(email: String, password: String) -> AnyPublisher<String, Error> {
        return Future<String, Error> { promise in
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                
                guard let user = result?.user else {
                    promise(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Login failed."])))
                    return
                }
                let db = Firestore.firestore()
                db.collection("users").document(user.uid).getDocument { document, error in
                    if let error = error {
                        promise(.failure(error))
                    } else if let document = document, document.exists, let name = document.data()?["name"] as? String {
                        promise(.success(name))
                    } else {
                        promise(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "name not found."])))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signInWithGoogle() -> AnyPublisher<Void, Error> {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No Firebase clientID found")
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        return Future<Void, Error> { promise in
            Task {
                do {
                    guard let scene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
                          let rootViewController = await scene.windows.first?.rootViewController else {
                        fatalError("There is no root view controller!")
                    }
                    
                    let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
                    let googleUser = result.user
                    
                    guard let idToken = googleUser.idToken?.tokenString else {
                        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unexpected error occurred, please retry"])
                    }
                    
                    let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: googleUser.accessToken.tokenString)
                    let authResult = try await Auth.auth().signIn(with: credential)
                    
                    let user = authResult.user
                    
                    let db = Firestore.firestore()
                    try await db.collection("users").document(user.uid).setData([
                        "name": googleUser.profile?.givenName ?? "",
                        "email": googleUser.profile?.email ?? ""
                    ])
                    
                    promise(.success(()))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
}
