//
//  SceneDelegate.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 03.08.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        let tabBarController = UITabBarController()
        setupTabBarAppearance()

        let mtgController = MtgController()
        mtgController.title = "Magic The Gathering Cards"

        let marvelController = ComicsController()
        marvelController.title = "Marvel comics"

        tabBarController.setViewControllers([UINavigationController(rootViewController: mtgController),
                                             UINavigationController(rootViewController: marvelController)], animated: true)

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }

    private func setupTabBarAppearance() {
        if #available(iOS 15, *) {
              let tabBarAppearance = UITabBarAppearance()
              tabBarAppearance.configureWithDefaultBackground()
              UITabBar.appearance().standardAppearance = tabBarAppearance
              UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
    }
}
