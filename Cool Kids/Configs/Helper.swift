//
//  Helper.swift
//  Cool Kids
//
//  Created by lodex solutions on 2/19/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class Helper {
   static func setStatusBarColor(view : UIView , withColor:UIColor) {
           let tag = 12321
           if let _ = view.viewWithTag(tag){
           } else {
               let overView = UIView()
                 overView.frame = UIApplication.shared.statusBarFrame
               //overView.frame = (view.window?.windowScene?.statusBarManager?.statusBarFrame) ??  UIView().frame
               overView.backgroundColor = withColor
               overView.tag = tag
               view.addSubview(overView)
           }
       }
}
	
