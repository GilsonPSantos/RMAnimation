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
        if CommandLine.arguments.contains("--UITests") {
            UIView.setAnimationsEnabled(false)
            self.clearDataBase()
        }
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        PersistentManager.shared.saveContext()
    }
    
    private func clearDataBase() {
        let result = PersistentManager.shared.fetchDataBase(Favorite.self)
        result?.forEach { PersistentManager.shared.context.delete($0) }
        PersistentManager.shared.saveContext()
    }
}

