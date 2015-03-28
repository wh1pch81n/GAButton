//
//  ViewController.swift
//  GAButton
//
//  Created by Derrick  Ho on 3/27/15.
//  Copyright (c) 2015 Derrick  Ho. All rights reserved.
//

import UIKit

class MainView : UIView {
    weak var delegate:UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpView()
    }
    
    func setUpView() {
        self.backgroundColor = UIColor.redColor()
        
        var coolButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        coolButton.setTitle("What's Up?", forState: UIControlState.Normal)
        coolButton.backgroundColor = UIColor.blueColor()
        self.addSubview(coolButton)
        coolButton.addTarget(delegate, action: "tappedButton:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
}

class ViewController: UIViewController {
    var mainView:(MainView?)
    var colorCount:(Int) = 0
    
    override func loadView() {
        super.loadView()
        self.view = MainView(frame: UIScreen.mainScreen().bounds)
        self.mainView = self.view as? MainView
        self.mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tappedButton(sender: UIButton!) {
        if colorCount % 2 == 0 {
            self.mainView?.backgroundColor = UIColor.blueColor()
        } else {
            self.mainView?.backgroundColor = UIColor.redColor()
        }
        colorCount++
    }
}

