//
//  ViewController.swift
//  quartzDemo
//
//  Created by lkk on 15-3-20.
//  Copyright (c) 2015年 LKK. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    let dic:NSDictionary = ["QuartzLines.m":["lines","Caps,Jions&Width","Dash Patterns"],"QuartzPolygons.m":["Rectangles","Polygons"],"QuartzCurves.m":["Ellipses & Arcs","Beziers & Quadratics"]]
    let arr = ["QuartzLines.m","QuartzPolygons.m","QuartzCurves.m"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}

