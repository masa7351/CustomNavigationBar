//
//  AppDelegate.swift
//  UINavigationBar Programmatically
//
//  Created by ShawnBaek on 2017. 10. 6..
//  Copyright © 2017 ShawnBaek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var isIphoneX: Bool = false
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {        
        //check iPhoneX
        if (window?.safeAreaInsets.top)! > CGFloat(0.0) || window?.safeAreaInsets != .zero {
            isIphoneX = true
        }
        return true
    }


}

