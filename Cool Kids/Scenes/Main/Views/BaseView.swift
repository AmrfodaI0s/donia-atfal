//
//  BaseView.swift
//  Cool Kids
//
//  Created by Eslam on 3/29/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit
@IBDesignable

class BaseView: UIView {
    override init(frame: CGRect) {
           super.init(frame: frame)
       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       }
}
