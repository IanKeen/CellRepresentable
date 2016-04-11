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
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let navController = UINavigationController()
        
        self.navigationCoordinator = NavigationCoordinator(navigationController: navController)
        self.navigationCoordinator.start()
        
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        return true
    }
}
