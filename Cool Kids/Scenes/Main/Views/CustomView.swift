//
//  CustomView.swift
//  Cool Kids
//
//  Created by Eslam on 4/11/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 12 {
        didSet {
            self.setNeedsLayout()
        }
    }
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
    }
    
 
}
