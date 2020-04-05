//
//  GradientView.swift
//  Cool Kids
//
//  Created by Eslam on 4/5/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

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
