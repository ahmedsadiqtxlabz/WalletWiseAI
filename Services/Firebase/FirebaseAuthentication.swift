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
import FirebaseCore
import CryptoKit
import AuthenticationServices

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
    
    func signInWithGoogle() -> AnyPublisher<User, Error> {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No Firebase clientID found")
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        return Future<User, Error> { promise in
            Task {
                do {
                    guard let scene = await MainActor.run(body: {UIApplication.shared.connectedScenes.first as? UIWindowScene}),
                          let rootViewController = await MainActor.run(body: {
                              scene.windows.first?.rootViewController}) else {
                        fatalError("There is no root view controller!")
                    }
                    
                    let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
                    let googleUser = result.user
                    
                    guard let idToken = googleUser.idToken?.tokenString else {
                        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: L10n.Errors.general])
                    }
                    
                    let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: googleUser.accessToken.tokenString)
                    let authResult = try await Auth.auth().signIn(with: credential)
                    
                    let user = authResult.user
                    let data = User(
                        name: googleUser.profile?.name ?? "",
                        email: googleUser.profile?.email ?? "")
                    DefaultsService.token = user.uid
                    FirebaseDatabase.saveUser(id: user.uid, user: data) {
                        promise(.success(data))
                    } failure: { error in
                        promise(.failure(error))
                    }
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signInWithApple() -> AnyPublisher<User, Error> {
        return Future<User, Error> { promise in
            
            AppleAuthentication.shared.signInWithApple { credentials in
                Auth.auth().signIn(with: credentials) { authResult, error in
                    if let error = error {
                        promise(.failure(error))
                        return
                    }
                    
                    guard let user = authResult?.user else {
                        promise(.failure(NSError(domain: "SignInError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to retrieve user."])))
                        return
                    }
                    
                    let data = User(name: user.displayName ?? "", email: user.email ?? "")
                    DefaultsService.token = user.uid
                    
                    FirebaseDatabase.saveUser(id: user.uid, user: data) {
                        promise(.success(data))
                    } failure: { error in
                        promise(.failure(error))
                    }
                }
            } onError: { error in
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}

extension FirebaseAuthentication {
    
    private func handleAuthError(_ error: NSError) -> String {
        guard let errorCode = AuthErrorCode.Code(rawValue: error.code) else {
            return L10n.Errors.general
        }
        
        switch errorCode {
        case .userNotFound:
            return L10n.Errors.userNotFound
        case .userDisabled:
            return L10n.Errors.userDisabled
        case .invalidCredential:
            return L10n.Errors.invalidCredential
        default:
            return "Error: \(error.localizedDescription)"
        }
    }
}
