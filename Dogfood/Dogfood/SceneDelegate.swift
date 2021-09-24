//
//  SceneDelegate.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let _ = UserDefaults.standard.string(forKey: "familyCode") ,
           let _ = UserDefaults.standard.string(forKey: "userName"){
            
            let rootVC = UIStoryboard(name: "main", bundle: nil).instantiateViewController(withIdentifier: "main")
            window?.rootViewController = UINavigationController(rootViewController: rootVC)
            window?.makeKeyAndVisible()
            
        }else{
            let rootVC = UIStoryboard(name: "UserSettings", bundle: nil).instantiateViewController(withIdentifier: "SelectViewController")
            window?.rootViewController = UINavigationController(rootViewController: rootVC)
            window?.makeKeyAndVisible()
        }
//        let rootVC = UIStoryboard(name: "UserSettings", bundle: nil).instantiateViewController(withIdentifier: "SelectViewController")
//        window?.rootViewController = UINavigationController(rootViewController: rootVC)
//        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

