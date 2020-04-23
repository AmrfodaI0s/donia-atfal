//
//  Helper.swift
//  Cool Kids
//
//  Created by lodex solutions on 2/19/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit
import Lottie
import Kingfisher
class Helper {
    static var vSpinner : UIView?
    var initialTouchPoint: CGPoint = CGPoint(x: 0, y: 0)

    //MARK: -  set Status bar Color
    static func setStatusBarColor(view : UIView , withColor:UIColor) {
        let tag = 12321
        if let _ = view.viewWithTag(tag){
        } else {
            let overView = UIView()
            overView.frame = UIApplication.shared.statusBarFrame
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
    
    //MARK: - declare lottie's settings
    class func setLottieAnimation(splach_view : AnimationView ,_ json_name: String) {
         // set the lottie's json file-name
         let animation = Animation.named(json_name)
         splach_view.animation = animation
         splach_view.layer.cornerRadius = 25
         splach_view.animationSpeed = 1
         splach_view.play()
     }
    
    //MARK: -  Set Image by url - KF
    class func displayImage(imageView: UIImageView?, url: String) {
        let Url = url.hasPrefix("http") ? url : URLs.imageRequestURL + url
        imageView?.kf.indicatorType = .activity
        imageView?.kf.setImage(with: URL(string : Url ), options: [.transition(.flipFromRight(0.3))])
    }
    //MARK: - Gesture Dismiss from Top
    func dismissTransition(vc: UIViewController,_ sender:  UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: vc.view?.window)
        if(sender.state == UIGestureRecognizer.State.began){
            initialTouchPoint = touchPoint
        } else if(sender.state == UIGestureRecognizer.State.changed) {
            if touchPoint.y - initialTouchPoint.y > 0 {
                vc.view.frame = CGRect(x: 0, y: touchPoint.y, width: vc.view.frame.width, height: vc.view.frame.height)
            }
        }else if sender.state == UIGestureRecognizer.State.ended || sender.state==UIGestureRecognizer.State.cancelled{
            
            if touchPoint.y - initialTouchPoint.y > 150 {
                vc.dismiss(animated: true, completion: nil)
            }else{
                UIView.animate(withDuration: 0.5, animations: {vc.view.frame = CGRect(x: 0, y: 0, width: vc.view.frame.width, height: vc.view.frame.height)})
            }
        }
    }
} // end of Helper class

/*
 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     if let touch = touches.first {
         if touch.view == video_view {
             print("video view begins")
             videoConfig()
         }
     }
 }
 */


