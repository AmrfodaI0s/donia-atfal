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
	
class Gredient: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
  
    func Gradiant_View(first_color : UIColor , second_color : UIColor) {
        let gradiantLayer = CAGradientLayer()
        gradiantLayer.frame = self.bounds
        gradiantLayer.colors = [first_color.cgColor , second_color.cgColor]
        gradiantLayer.locations = [0.0 , 1.0]
        layer.insertSublayer(gradiantLayer, at: 0)
    }
}

class x : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
