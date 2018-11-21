//
//  AppDelegate.swift
//  3DTouch
//
//  Created by Sky on 11/21/2018.
//  Copyright (c) 2018 Sky. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.add3DTouch()
        
        let shortItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem
        if let temShortItem = shortItem {
            let alertView = UIAlertController(title: temShortItem.type, message: temShortItem.localizedTitle, preferredStyle: .alert)
            self.window?.rootViewController?.present(alertView, animated: true, completion: nil)
        }
        
        return true
    }

    
    /// MARK - 添加3DTouch
    private func add3DTouch() {
        
        let icon = UIApplicationShortcutIcon(type: .add)
        let add = UIApplicationShortcutItem(type: "Add",
                                            localizedTitle: "添加",
                                            localizedSubtitle: nil,
                                            icon: icon, userInfo: nil)
        
        
        let shareIcon = UIApplicationShortcutIcon(type: .share)
        let share = UIApplicationShortcutItem(type: "share",
                                            localizedTitle: "分享",
                                            localizedSubtitle: nil,
                                            icon: shareIcon, userInfo: nil)
        
        UIApplication.shared.shortcutItems = [add, share]
        
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        debugPrint(shortcutItem.type)
        
        let alertView = UIAlertController(title: shortcutItem.type, message: shortcutItem.localizedTitle, preferredStyle: .alert)
        self.window?.rootViewController?.present(alertView, animated: true, completion: nil)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let alertView = UIAlertController(title: "XBWidgetDemo", message: url.absoluteString, preferredStyle: .alert)
        self.window?.rootViewController?.present(alertView, animated: true, completion: nil)
        return true
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

