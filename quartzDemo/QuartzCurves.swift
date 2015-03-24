//
//  QuartzCurves.swift
//  quartzDemo
//
//  Created by lkk on 15-3-23.
//  Copyright (c) 2015年 LKK. All rights reserved.
//

import UIKit

class QuartzCurves: UIView {
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        UIColor.whiteColor().setStroke()
        UIColor.blueColor().setFill()
        CGContextSetLineWidth(context, 2.0)
        CGContextAddEllipseInRect(context, CGRectMake(30.0, 100.0, 60.0, 60.0));
        CGContextStrokePath(context);
        CGContextStrokeEllipseInRect(context, CGRectMake(30.0, 190.0, 60.0, 60.0));
        CGContextFillEllipseInRect(context, CGRectMake(30.0, 280.0, 60.0, 60.0));
        let PI = (CGFloat)(M_PI)
        CGContextAddArc(context, 150.0, 130.0, 30.0, 0.0, PI / 2, 0)
        CGContextStrokePath(context);
        CGContextAddArc(context, 150.0, 130.0, 30.0, 3.0*PI/2.0, PI, 1);
        CGContextStrokePath(context);
        CGContextAddArc(context, 150.0, 220.0, 30.0, 0.0, PI/2.0, 0);
        CGContextAddArc(context, 150.0, 220.0, 30.0, 3.0*PI/2.0, PI, 1);
        CGContextStrokePath(context);
        CGContextAddArc(context, 150.0, 310.0, 30.0, 0.0, PI/2.0, 0);
        CGContextAddArc(context, 150.0, 310.0, 30.0, PI, 3.0*PI/2.0, 0);
        CGContextStrokePath(context);
        let p =
            [
                CGPointMake(210.0, 100.0),
                CGPointMake(210.0, 130.0),
                CGPointMake(240.0, 130.0),
            ]
        CGContextMoveToPoint(context, p[0].x, p[0].y);
        CGContextAddArcToPoint(context, p[1].x, p[1].y, p[2].x, p[2].y, 30.0);
        CGContextStrokePath(context);
        CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
        CGContextAddLines(context, p, 3);
        CGContextStrokePath(context);
         CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
        let rrect = CGRectMake(210.0, 160.0, 60.0, 60.0);
        let radius:CGFloat = PI * 2;
        let minx = CGRectGetMinX(rrect), midx = CGRectGetMidX(rrect), maxx = CGRectGetMaxX(rrect);
        let miny = CGRectGetMinY(rrect)
        let midy = CGRectGetMidY(rrect)
        let maxy = CGRectGetMaxY(rrect)
        CGContextMoveToPoint(context, minx, midy);
        CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
        CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
        CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
        CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFillStroke);
        
    }
}
class BezierPath:UIView {
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        UIColor.whiteColor().setStroke()
        UIColor.blueColor().setFill()
        CGContextSetLineWidth(context, 2.0)
        let s = CGPointMake(30.0, 120.0)
        let e = CGPointMake(300.0, 120.0)
        let cp1 = CGPointMake(120.0, 30.0)
        let cp2 = CGPointMake(210.0, 210.0)
        CGContextMoveToPoint(context, s.x, s.y)
        CGContextAddCurveToPoint(context, cp1.x, cp1.y, cp2.x, cp2.y, e.x, e.y)
        CGContextStrokePath(context)
        CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0)
        CGContextMoveToPoint(context, s.x, s.y)
        CGContextAddLineToPoint(context, cp1.x, cp1.y)
        CGContextMoveToPoint(context, e.x, e.y)
        CGContextAddLineToPoint(context, cp2.x, cp2.y)
        CGContextStrokePath(context)
    }
    
}