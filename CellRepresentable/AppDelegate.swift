//
//  AppDelegate.swift
//  CellRepresentable
//
//  Created by Ian Keen on 8/04/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigationCoordinator: NavigationCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController()
        
        self.navigationCoordinator = NavigationCoordinator(navigationController: navController)
        self.navigationCoordinator.start()
        
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        return true
    }
}
