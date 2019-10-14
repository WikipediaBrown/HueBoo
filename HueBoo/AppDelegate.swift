//
//  AppDelegate.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 9/4/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import Firebase
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var interactor: RootInteractor?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        interactor = RootInteractor(presenter: RootViewController(), colorManager: ColorManager())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = interactor?.presenter as? UIViewController
        window?.makeKeyAndVisible()
        
        return true
        
    }
    
}
