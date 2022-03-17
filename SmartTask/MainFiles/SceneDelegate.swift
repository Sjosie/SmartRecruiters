//
//  SceneDelegate.swift
//  SmartTask
//
//  Created by Evgeny Protopopov on 17.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let navigationVC = UINavigationController(rootViewController: UsersViewController())
        window.rootViewController = navigationVC
        self.window = window
        window.makeKeyAndVisible()
    }
}
