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
    
    //MARK: -  set Status bar Color
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
    //MARK: -  Show and Hide Spinner
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
    //MARK: -  save Device FrameHeight to UserDefault
    class func saveUserDefaults(height : CGFloat) {
        let userDefault = UserDefaults.standard
        userDefault.set(height, forKey: "frameHeight")
        userDefault.synchronize()
    }
    
    //MARK: -  getTime function
    class func getTime(time : Float) -> String {
        let hours = Int(time/3600)
        let mints = Int(time/60) % 60
        let seconds = Int(time.truncatingRemainder(dividingBy: 60))
        if hours > 0 {
            return "\(hours):\(mints):\(seconds)"
        } else {
            return "\(mints):\(seconds)"
        }
    }

} // end of Helper class




