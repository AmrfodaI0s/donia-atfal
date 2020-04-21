//
//  MainVC + Animations.swift
//  Cool Kids
//
//  Created by Eslam on 4/11/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

extension MainVC {
    //MARK: -  setLabelAnimation
    func labelAnimate() {
        splash_label.text = ""
        var charIndex = 0.0
        let titleText = "أول تطبيق لمشاهدة أفلام الكرتون"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { (timer) in
                self.splash_label.text?.append(letter)
            }
            charIndex += 1
        }
        
    }
 
 func animateStartButtonCenter() {
     
    UIView.animate(withDuration: 3) {
        self.StartBtnYConstraint.constant = 100 //self.view.center.x
        self.labelCenterYConstraints.constant = -60
        self.view.layoutIfNeeded()
    }
 }
 
 func shrinkStartButton() {
     startBtnWidthConstraints.constant = 240
        UIView.animate(withDuration: 4, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
         self.view.layoutIfNeeded()
     }, completion: nil)
 }
}
