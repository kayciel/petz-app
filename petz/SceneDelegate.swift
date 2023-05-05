//
//  SceneDelegate.swift
//  petz
//
//  Created by Kayciel Ramos on 4/27/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = createTabbar()
        window.makeKeyAndVisible()
    }
    
    func createProfileNavigationController() -> UINavigationController {
        let profileVC = ProfilePushViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle", withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle)), tag: 0)
        return UINavigationController(rootViewController: profileVC)
    }
    
    func createSittersNavigationController() -> UINavigationController {
        let sittersVC = ViewController()
        sittersVC.tabBarItem = UITabBarItem(title: "Pet Sitters", image: UIImage(systemName: "pawprint.fill", withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle)), tag: 1)
        return UINavigationController(rootViewController: sittersVC)
    }
    
    func createTransactionsNavigationController() -> UINavigationController {
        let transactionsVC = TransactionPushViewController()
        transactionsVC.tabBarItem = UITabBarItem(title: "Transactions", image: UIImage(systemName: "creditcard", withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle)), tag: 2)
        return UINavigationController(rootViewController: transactionsVC)
    }
    
    func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .lightGray
        tabbar.viewControllers = [createTransactionsNavigationController(), createSittersNavigationController(), createProfileNavigationController()]
        return tabbar
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

