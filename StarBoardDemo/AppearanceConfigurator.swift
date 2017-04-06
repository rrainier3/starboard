//
//  AppearanceConfigurator.swift
//  StarBoardDemo
//
//  Created by RayRainier on 3/31/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//
import UIKit
import Foundation

class AppearanceConfigurator {
    
    class func configureNavigationBar() {
    
    
        let font = UIFont(name: "SFUIDisplay-Ultralight", size: 36)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName: font!]
    
//        UIApplication.shared.statusBarStyle = .default
//        
//        UINavigationBar.appearance().barTintColor = .lightGray
//        UINavigationBar.appearance().isTranslucent = false
//        //UINavigationBar.appearance().tintColor = .black
//    
//        
//        let attributes: [String: AnyObject] = [
//        	NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20),
//            NSForegroundColorAttributeName : UIColor.orange
//        ]
//        
//        UINavigationBar.appearance().titleTextAttributes = attributes
        
    }
    
}
