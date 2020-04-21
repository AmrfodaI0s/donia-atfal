//
//  AnimeDetailsVC + PanGesture.swift
//  Cool Kids
//
//  Created by Eslam on 4/2/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

//MARK: -  create Pan Gesture to swipe back to SuperVC
extension AnimeDetailsVC : UIGestureRecognizerDelegate {
    
    
    //MARK: -  swipe by UIPanGestureRecognizer
    func SwipeBack() {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(swipeTriggerd))
        anime.swipeableView.addGestureRecognizer(gesture)
        anime.swipeableView.isUserInteractionEnabled = true
        gesture.delegate = self
    }
    @objc func swipeTriggerd(gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            dismissFromRight()
        }
    }
    //MARK: -  swipe by UIScreenEdgePanGestureRecognizer
    func swipeFromRight() {
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .right
        anime.containerView.addGestureRecognizer(edgePan)
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        
        if recognizer.state == .began {
            print("Screen edge swiped!")
            dismissFromRight()
        }
    }
    func dismissFromRight() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.subtype = CATransitionSubtype.fromRight
        transition.type = CATransitionType.push
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}
