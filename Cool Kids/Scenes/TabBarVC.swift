//
//  TabBarVC.swift
//  Cool Kids
//
//  Created by Eslam on 2/11/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "sukar-bold", size: 14)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: [.normal])
        self.tabBar.frame.size.height = 64
        self.selectedIndex = 2
        self.tabBarItem.badgeColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        //self.tabBar.tintColor = .lightGray
        //self.tabBar.barTintColor = UIColor(red:0.21, green:0.23, blue:0.31, alpha:1.0)
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.barStyle = .black
      
    }
    
}
extension UITabBar {
    override public func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        let fHeight = UserDefaults.standard.object(forKey: "frameHeight") as! Int
        if fHeight > 750 {
            sizeThatFits.height = 88
        } else {
            sizeThatFits.height = 64
            print(self.layer.frame.size.height)
        }
        
        return sizeThatFits
    }
}

class CustomTabBar: UITabBar {
 
    override func sizeThatFits(_ size: CGSize) -> CGSize {
          var size = super.sizeThatFits(size)
          size.height = 88
          return size
     }
}
