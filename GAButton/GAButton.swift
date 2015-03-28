//
//  GAButton.swift
//  GAButton
//
//  Created by Derrick  Ho on 3/27/15.
//  Copyright (c) 2015 Derrick  Ho. All rights reserved.
//

import UIKit

class GAButton: UIView {
    var actionBlock: ((sender: GAButton) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    func setUpView() {
        self.backgroundColor = UIColor.greenColor()
        var touchGesture = UITapGestureRecognizer(target: self, action: "tappedButton:")
        self.addGestureRecognizer(touchGesture)
    }
    
    func tappedButton(sender:(AnyObject)) {
        if let ab = self.actionBlock {
            ab(sender: self)
        }
    }
}
