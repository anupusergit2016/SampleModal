//
//  SecondView.swift
//  SampleModal
//
//  Created by GiriAdmin on 28/09/17.
//  Copyright © 2017 AgniAdmin. All rights reserved.
//

import UIKit

class SecondView: UIView {

    convenience init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!)
    {
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
    }
    
    class func instanceFromNib() -> UIView {
        
        return UINib(nibName: "SecondView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
        
    }
    override func  layoutSubviews() {
        
    }
}

