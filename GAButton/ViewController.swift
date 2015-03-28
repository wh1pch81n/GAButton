//
//  ViewController.swift
//  GAButton
//
//  Created by Derrick  Ho on 3/27/15.
//  Copyright (c) 2015 Derrick  Ho. All rights reserved.
//

import UIKit

class MainView : UIView {
    var coolButton:(UIButton)!
    var hotButton:(GAButton)!
    var tableView:(UITableView)!
    
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
        
        self.coolButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        self.coolButton.setTitle("What's Up?", forState: UIControlState.Normal)
        self.coolButton.backgroundColor = UIColor.blueColor()
        self.addSubview(self.coolButton)
        
        self.hotButton = GAButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        hotButton.center = self.center
        self.addSubview(hotButton)
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: self.frame.size.height / 2, width: self.frame.size.width, height: self.frame.size.height / 2))
        self.addSubview(self.tableView)
    }
}

class ViewController: UIViewController, UITableViewDataSource {
    var mainView:(MainView?)
    var colorCount:(Int) = 0
    var hotButton:(GAButton)!
    var coldButton:(UIButton)!
    var tableView:(UITableView)!
    var heroRosterArray:(Array<Dictionary<String, AnyObject>>)! = []
    
    override func loadView() {
        super.loadView()
        self.view = MainView(frame: UIScreen.mainScreen().bounds)
        self.mainView = self.view as? MainView
        self.hotButton = (self.view as MainView).hotButton
        self.coldButton = (self.view as MainView).coolButton
        self.tableView = (self.view as MainView).tableView
        self.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.  
        self.coldButton?.addTarget(self, action: "tappedButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.hotButton?.actionBlock = { (sender: GAButton) in
            if let heroPlistPath = NSBundle.mainBundle().pathForResource("Heros", ofType: "plist") {
                //println(heroPlistPath)
                if let heroPlistData = NSData(contentsOfFile: heroPlistPath) {
                    if let heroRosterArray =  NSPropertyListSerialization.propertyListWithData(heroPlistData, options: NSPropertyListReadOptions(), format: nil, error: nil) as? Array<Dictionary<String, AnyObject>> {
                        //println(heroRosterArray)
                        self.heroRosterArray = heroRosterArray
                        self.tableView.reloadData()
                    }
                }
            }
        }
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
    
    func tappedGAButton(sender: GAButton) {
        if colorCount % 2 == 0 {
            self.mainView?.backgroundColor = UIColor.yellowColor()
        } else {
            self.mainView?.backgroundColor = UIColor.whiteColor()
        }
        colorCount++
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:(UITableViewCell) = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: nil)
        cell.textLabel?.text = heroRosterArray[indexPath.row]["Name"] as? String ?? "MissingNo."
        if let thumnailUrlPath = heroRosterArray[indexPath.row]["ThumbnailURL"] as? String {
            if let thumbnailUrl = NSURL(string: thumnailUrlPath) {
                if let thumbnailData = NSData(contentsOfURL: thumbnailUrl) {
                    cell.imageView?.image = UIImage(data: thumbnailData)
                }
            }
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.heroRosterArray.count
    }
}

