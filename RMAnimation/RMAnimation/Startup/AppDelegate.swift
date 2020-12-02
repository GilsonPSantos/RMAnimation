//
//  AppDelegate.swift
//  RMAnimation
//
//  Created by Gilson Santos on 30/11/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigation = UINavigationController()
        let mainCoordinator = TabBarCoordinator(navigationController: navigation)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
        mainCoordinator.start()
        self.coordinator = mainCoordinator
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        PersistentManager.shared.saveContext()
    }
}

