//
//  ViewController.swift
//  GAButton
//
//  Created by Derrick  Ho on 3/27/15.
//  Copyright (c) 2015 Derrick  Ho. All rights reserved.
//

import UIKit

class MainView : UIView {
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
    }
}

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        self.view = MainView(frame: UIScreen.mainScreen().bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

