//
//  Helper.swift
//  Cool Kids
//
//  Created by lodex solutions on 2/19/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class Helper {
   static var vSpinner : UIView?
    
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
    
   class func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
   class func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
}


@IBDesignable class GradientView: UIView {
    
    @IBInspectable var topColor: UIColor = UIColor.blue {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable var bottomColor: UIColor = UIColor.orange {
        didSet {
            self.setNeedsLayout()
        }
    }
    override func layoutSubviews() {
        let gradient = CAGradientLayer()
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        //        gradient.startPoint = CGPoint(x: 0, y: 0)
        //        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.locations = [0.0 , 1.0]
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
    
}

