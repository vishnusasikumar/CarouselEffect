//
//  AppDelegate.swift
//  CarouselEffect
//
//  Created by Vishnu Sasikumar on 2/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = InterestViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

