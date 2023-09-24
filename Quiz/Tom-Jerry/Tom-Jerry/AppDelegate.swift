//
//  AppDelegate.swift
//  Tom-Jerry
//
//  Created by Mariam Sikandari on 2023-06-22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
 
 

    var window: UIWindow?
    var quizVM = QuizVM()
    let body = BodySection()
    let quizView = QuizViewController()
    let result = ResViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
      
        registerForNotifications()
        window?.rootViewController = quizView
       
        return true
    }
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil)
    }
    

}


extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.9,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

extension AppDelegate {

    @objc func didLogout() {
        setRootViewController( ResViewController())
       
    }


    

}
