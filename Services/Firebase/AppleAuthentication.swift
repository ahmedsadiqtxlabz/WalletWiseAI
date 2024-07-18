//
//  AppleAuthentication.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 11/07/2024.
//

import Foundation
import CryptoKit
import AuthenticationServices
import FirebaseAuth

final class AppleAuthentication: NSObject, ObservableObject {
    
    static let shared = AppleAuthentication()
    
    private override init() {}
    
    var currentNonce: String?
    private var successHandler: ((AuthCredential) -> Void)?
    private var errorHandler: ((Error) -> Void)?
    
    func signInWithApple(
        onSuccess: @escaping (AuthCredential) -> Void,
        onError: @escaping (Error) -> Void) {
            DispatchQueue.main.async {
                self.successHandler = onSuccess
                self.errorHandler = onError
                let nonce = self.randomNonceString()
                self.currentNonce = nonce
                let appleIDProvider = ASAuthorizationAppleIDProvider()
                let request = appleIDProvider.createRequest()
                request.requestedScopes = [.fullName, .email]
                request.nonce = self.sha256(nonce)
                
                let authorizationController = ASAuthorizationController(authorizationRequests: [request])
                authorizationController.delegate = self
                authorizationController.performRequests()
            }
        }
    
}

extension AppleAuthentication: ASAuthorizationControllerDelegate {
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization) {
            if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                guard let nonce = currentNonce else {
                    fatalError("Invalid state: A login callback was received, but no login request was sent.")
                }
                guard let appleIDToken = appleIDCredential.identityToken else {
                    print("Unable to fetch identity token")
                    return
                }
                guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                    print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                    return
                }
                let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                          idToken: idTokenString,
                                                          rawNonce: nonce)
                self.successHandler?(credential)
            }
        }
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: any Error) {
            print("Sign in with Apple errored: \(error)")
            self.errorHandler?(error)
        }
}

extension AppleAuthentication {
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError(
                        "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
                    )
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
}
