//
//  SceneDelegate.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 27/10/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
//        let nav = UINavigationController(rootViewController: NavigationViewController() )
//       let nav = UINavigationController(rootViewController: MainTabController())
//        let nav = UINavigationController(rootViewController: LoginController())
        let nav = UINavigationController(rootViewController: RegisterViewController() )
//        let rv = RegisterViewController()
 //       nav.viewControllers = nav
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       
    }

    func sceneWillResignActive(_ scene: UIScene) {
     
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
     
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
      
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

