//
//  SceneDelegate.swift
//  TwitterUI
//
//  Created by Filip Cecelja on 9/1/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var mainViewController = MainViewController()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = mainViewController
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
        self.window = window
        self.handle(connectionOptions.urlContexts)
        
    }
    
    private func handle(_ urlContexts: Set<UIOpenURLContext>) {
        if let url = urlContexts.first?.url{
            @Binding var _: String = url.absoluteString
            print("handle" + url.absoluteString)
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let firstUrl = URLContexts.first?.url else {
            return
        }
        //self.handle(URLContexts)
        print("openURLContexts " + firstUrl.absoluteString)
        
        guard let components = NSURLComponents(url: firstUrl, resolvingAgainstBaseURL: true), let host = components.host else {
            print("Invalid URL")
            return
        }
        print("components: \(components)")

        guard let deepLink = DeepLink(rawValue: host) else {
            print("Deeplink not found: \(host)")
            return
        }
        print(deepLink)
        mainViewController.handleDeepLink(deepLink, givenParam: components.query)

    }
    

}


