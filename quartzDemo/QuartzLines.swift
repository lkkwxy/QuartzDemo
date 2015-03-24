//
//  QuartzLines.swift
//  quartzDemo
//
//  Created by lkk on 15-3-20.
//  Copyright (c) 2015年 LKK. All rights reserved.
//

import UIKit

class QuartzLines: UIView {

    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        UIColor.whiteColor().set()
        CGContextSetLineWidth(context, 2.0)
        CGContextMoveToPoint(context, 10.0, 30.0)
        CGContextAddLineToPoint(context, 310.0, 30.0)
//         CGContextStrokePath(context)
        let addLines1 =
            [
                CGPointMake(10.0, 90.0),
                CGPointMake(70.0, 60.0),
                CGPointMake(130.0, 90.0),
                CGPointMake(190.0, 60.0),
                CGPointMake(250.0, 90.0),
                CGPointMake(310.0, 60.0)
        ]
        let count1:UInt = (UInt)(addLines1.count)
        CGContextAddLines(context, addLines1, count1)
        CGContextStrokePath(context)
        var addLines =
            [
                CGPointMake(10.0, 150.0),
                CGPointMake(70.0, 120.0),
                CGPointMake(130.0, 150.0),
                CGPointMake(190.0, 120.0),
                CGPointMake(250.0, 150.0),
                CGPointMake(310.0, 120.0)
           ]
        let count:UInt = (UInt)(addLines.count)
//        CGContextAddLines(context, addLines, count)
        CGContextStrokeLineSegments(context, addLines, count)
    }
   
}
class Cap: UIView {
    var cap:CGLineCap = kCGLineCapRound {
        didSet{
            self.setNeedsDisplay()
        }
    }
    var jion:CGLineJoin = kCGLineJoinRound{
        didSet{
           self.setNeedsDisplay()
        }
    }
    var width:CGFloat = 20{
        didSet{
           if(self.width < 4.0) {self.width = 4.0}
           self.setNeedsDisplay()
        }
    }
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        UIColor.whiteColor().set()
        CGContextSaveGState(context)
        CGContextMoveToPoint(context, 40.0, 80.0);
        CGContextAddLineToPoint(context, 280.0, 80.0);
        CGContextSetLineWidth(context, self.width)
        CGContextSetLineCap(context, self.cap)
        CGContextSetLineJoin(context, self.jion)
        CGContextMoveToPoint(context, 40.0, 240.0);
        CGContextAddLineToPoint(context, 160.0, 120.0);
        CGContextAddLineToPoint(context, 280.0, 240.0);
        CGContextSetLineWidth(context, self.width)
        CGContextSetLineCap(context, self.cap)
        CGContextSetLineJoin(context, self.jion)
        CGContextStrokePath(context);
        CGContextRestoreGState(context);
        if (self.width > 4.0)
        {
            UIColor.redColor().set()
            CGContextMoveToPoint(context, 40.0, 80.0);
            CGContextAddLineToPoint(context, 280.0, 80.0);
            CGContextMoveToPoint(context, 40.0, 240.0);
            CGContextAddLineToPoint(context, 160.0, 120.0);
            CGContextAddLineToPoint(context, 280.0, 240.0);
            CGContextSetLineWidth(context, 2.0);
            CGContextStrokePath(context);
        }
    }
}
class Dash: UIView {
    var dash:CGFloat = 0.0
//    var first:Bool = true
    var offset:CGFloat =  2
    var displayLink:CADisplayLink!
    var max:CGFloat{
        let p = (CGFloat)(M_PI)
        return p * 20.0
    }
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        UIColor.whiteColor().set()
        var temp:CGFloat = 10.0
        var dashs = [temp,temp]
        CGContextSetLineDash(context, dash, dashs, 2);
        CGContextMoveToPoint(context, 10.0, 20.0);
        CGContextAddLineToPoint(context, 310.0, 20.0);
        CGContextMoveToPoint(context, 160.0, 30.0);
        CGContextAddLineToPoint(context, 160.0, 130.0);
        CGContextAddRect(context, CGRectMake(10.0, 30.0, 100.0, 100.0));
        CGContextAddEllipseInRect(context, CGRectMake(210.0, 30.0, 100.0, 100.0));
        CGContextSetLineWidth(context, 2.0);
        CGContextStrokePath(context);
        if((displayLink) == nil){
            displayLink = CADisplayLink(target: self, selector: "update")
            displayLink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
//            self.first = false;
        }
        
    }
    func angelWithFloat(angle:CGFloat)->CGFloat{
        return 0;
    }
    func update(){
        dash += offset
        self.setNeedsDisplay()
    }
}