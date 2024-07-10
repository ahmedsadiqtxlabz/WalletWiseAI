//
//  FirebaseService.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 04/06/2024.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import Combine

final class FirebaseAuthentication: NSObject, ObservableObject {
    
    func signUp(email: String, name: String, password: String) -> AnyPublisher<User, Error> {
        Future<User, Error> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                
                guard let user = result?.user else {
                    promise(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User creation failed."])))
                    return
                }
                let data = User(name: name, email: email)
                FirebaseDatabase.saveUser(id: user.uid, user: data) {
                    DefaultsService.token = user.uid
                    promise(.success(data))
                } failure: { error in
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signIn(email: String, password: String) -> AnyPublisher<User, Error> {
        return Future<User, Error> { promise in
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error as? NSError {
                    let customErrorMessage = self.handleAuthError(error)
                    
                    let customError: Error = NSError(domain: customErrorMessage, code: error.code)
                    promise(.failure(customError))
                    return
                }
                
                guard let user = result?.user else {
                    promise(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Login failed."])))
                    return
                }
                FirebaseDatabase.getUser(id: user.uid) { value in
                    DefaultsService.token = user.uid
                    promise(.success(value))
                } _: { error in
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    //    func signInWithGoogle() -> AnyPublisher<Void, Error> {
    //        guard let clientID = FirebaseApp.app()?.options.clientID else {
    //            fatalError("No Firebase clientID found")
    //        }
    //
    //        let config = GIDConfiguration(clientID: clientID)
    //        GIDSignIn.sharedInstance.configuration = config
    //
    //        return Future<Void, Error> { promise in
    //            Task {
    //                do {
    //                    guard let scene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
    //                          let rootViewController = await scene.windows.first?.rootViewController else {
    //                        fatalError("There is no root view controller!")
    //                    }
    //
    //                    let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
    //                    let googleUser = result.user
    //
    //                    guard let idToken = googleUser.idToken?.tokenString else {
    //                        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unexpected error occurred, please retry"])
    //                    }
    //
    //                    let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: googleUser.accessToken.tokenString)
    //                    let authResult = try await Auth.auth().signIn(with: credential)
    //
    //                    let user = authResult.user
    //
    //                    let db = Firestore.firestore()
    //                    try await db.collection("users").document(user.uid).setData([
    //                        "name": googleUser.profile?.givenName ?? "",
    //                        "email": googleUser.profile?.email ?? ""
    //                    ])
    //
    //                    promise(.success(()))
    //                } catch {
    //                    promise(.failure(error))
    //                }
    //            }
    //        }
    //        .eraseToAnyPublisher()
    //    }
    
}

extension FirebaseAuthentication {
    private func handleAuthError(_ error: NSError) -> String {
        guard let errorCode = AuthErrorCode.Code(rawValue: error.code) else {
            return "Unknown error occurred. Please try again."
        }

        switch errorCode {
        case .userNotFound:
            return "No account found for this email. Please sign up."
        case .userDisabled:
            return "This account has been disabled. Please contact support."
        case .invalidCredential:
            return "Invalid credentials. Please try again."
        default:
            return "Error: \(error.localizedDescription)"
        }
    }
}
