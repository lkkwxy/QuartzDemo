//
//  DashViewController.swift
//  quartzDemo
//
//  Created by lkk on 15-3-23.
//  Copyright (c) 2015年 LKK. All rights reserved.
//

import UIKit

class DashViewController: UIViewController {
    @IBOutlet weak var dashView: Dash!
    override func viewWillDisappear(animated: Bool) {
        if ((self.dashView.displayLink) != nil){
            self.dashView.displayLink.invalidate()
            self.dashView.displayLink = nil
            
        }
       
    }
    override func viewWillAppear(animated: Bool) {
        if ((self.dashView.displayLink) == nil){
            self.dashView.displayLink = CADisplayLink(target: self.dashView, selector: "update")
            self.dashView.displayLink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
        }
    }
}
