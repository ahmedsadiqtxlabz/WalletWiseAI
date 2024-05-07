//
//  SceneDelegate.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 02/05/2024.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        
        guard let windowScene = scene as? UIWindowScene else { return }
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = RootView()
            .modifier(SystemServices())
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
    }
}
