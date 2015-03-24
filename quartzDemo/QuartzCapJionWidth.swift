//
//  QuartzCapJionWidth.swift
//  quartzDemo
//
//  Created by lkk on 15-3-20.
//  Copyright (c) 2015年 LKK. All rights reserved.
//

import Uikit

class QuartzCapJionWidth: UIViewController {
    @IBOutlet weak var quartzView: Cap!

    @IBOutlet weak var WidthSlider: UISlider!
    @IBOutlet weak var JionSegmenterControl: UISegmentedControl!
    @IBOutlet weak var CapSegmenterControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func widthChangeAction(sender: UISlider) {
        self.quartzView.width = (CGFloat)(sender.value)
    }
    @IBAction func capChangeAction(sender: AnyObject) {
        var cap = sender as UISegmentedControl
        let temp = (UInt32)(cap.selectedSegmentIndex)
        self.quartzView.cap = CGLineCap(temp)
    }
    @IBAction func JionChangeAction(sender: UISegmentedControl) {
        let temp = (UInt32)(sender.selectedSegmentIndex)
        self.quartzView.jion = CGLineJoin(temp)
    }
}
