//
//  SceneDelegate.swift
//  Notedown
//
//  Created by Muhammad Suleman on 4/30/23.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        self.window = UIWindow(windowScene: scene as! UIWindowScene)
        var initialVC = UIViewController()
        
        //Firebase authCheck
        let user = Auth.auth().currentUser

        if (user == nil) {
            let storyboard = UIStoryboard(name: "AuthView", bundle: nil)
            initialVC = storyboard.instantiateViewController(withIdentifier: "LoginView")
        }else{
            print("\nUser-email -> \(user?.email)\n")
            let storyboard = UIStoryboard(name: "HomeView", bundle: nil)
            initialVC = storyboard.instantiateViewController(withIdentifier: "HomeView")
        }
        
        self.window?.rootViewController = UINavigationController(rootViewController: initialVC)
        self.window?.makeKeyAndVisible()
    }
    
    
    
    

    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    func sceneDidEnterBackground(_ scene: UIScene) { }
}

