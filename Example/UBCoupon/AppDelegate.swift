//
//  AppDelegate.swift
//  UBCoupon
//
//  Created by Gustavo on 07/03/2019.
//  Copyright (c) 2019 Gustavo. All rights reserved.
//

import UIKit
import UBCoupon

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let settings = CouponSettings.default
        settings.shareIcon = #imageLiteral(resourceName: "share")
        let vc = CouponViewController(settings: settings, code: "Código de indicação")
        vc.delegate = self
        let nav = UINavigationController(rootViewController: vc)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        vc.updateInvites([InviteViewModel(text: "<span>Seu amigo <b>Tulio </b> utilizou o seu convite! </span>", fontFamily: "system", date: Date())])
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

extension AppDelegate: CouponViewControllerDelegate {
    
    func couponViewController(_ viewController: CouponViewController, didRequestUpdate code: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            viewController.updateCode(code)
        }
    }
    
    func couponViewController(_ viewController: CouponViewController, didRequestShare code: String) {
        
        let activityVC = UIActivityViewController(activityItems: [code], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = viewController.view
        viewController.present(activityVC, animated: true, completion: nil)
    }
    
}
