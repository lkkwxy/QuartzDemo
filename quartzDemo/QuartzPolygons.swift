//
//  QuartzPolygons.swift
//  quartzDemo
//
//  Created by lkk on 15-3-23.
//  Copyright (c) 2015年 LKK. All rights reserved.
//

import UIKit

class QuartzPolygons: UIView,UIPickerViewDataSource,UIPickerViewDelegate{
    let dataSource = ["Fill","EOFill","Stroke","FillStroke","EOFillStroke"]
    var drawingMode:CGPathDrawingMode = kCGPathFill{
        didSet{
            self.setNeedsDisplay()
        }
    }
    @IBOutlet weak var mode: UIPickerView!
    override func drawRect(rect: CGRect) {
        mode.dataSource = self;
        mode.delegate = self;
        let context = UIGraphicsGetCurrentContext()
        UIColor.whiteColor().setStroke()
        UIColor.blueColor().setFill()
        CGContextSetLineWidth(context, 2.0)
        var center = CGPointMake(90.0, 160.0)
        CGContextMoveToPoint(context, center.x, center.y + 60.0);
        for(var i = 1;i < 5;i++){
            let floatX = (Float)(i * 4) * (Float)(M_PI) / 5.0
            let floatY = (Float)(i * 4) * (Float)(M_PI) / 5.0
            let x = (CGFloat)(60.0 * sinf(floatX))
            let y = (CGFloat)(60.0 * cosf(floatY))
            CGContextAddLineToPoint(context, x + center.x, y + center.y)
        }
        CGContextClosePath(context)
        center = CGPointMake(210.0, 160.0);
        CGContextMoveToPoint(context, center.x, center.y + 60.0);
        for(var i = 1; i < 6; ++i)
        {
            let floatX = (Float)(i * 2) * (Float)(M_PI) / 6.0
            let floatY = (Float)(i * 2) * (Float)(M_PI) / 6.0
            let x = (CGFloat)(60.0 * sinf(floatX))
            let y = (CGFloat)(60.0 * cosf(floatY))
            CGContextAddLineToPoint(context, center.x + x, center.y + y);
        }
        CGContextClosePath(context);
        CGContextDrawPath(context, drawingMode)
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1;
    }
    
   
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return dataSource.count;
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return dataSource[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let value:UInt32 = (UInt32)(pickerView.selectedRowInComponent(0))
        self.drawingMode =  CGPathDrawingMode(value)
    }

}
class QuartzRectView: UIView {
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        UIColor.whiteColor().setStroke()
        UIColor.blueColor().setFill()
        CGContextSetLineWidth(context, 2.0)
        CGContextAddRect(context, CGRectMake(30.0, 100.0, 60.0, 60.0))
        CGContextStrokePath(context)
        CGContextStrokeRect(context, CGRectMake(30.0, 190.0, 60.0, 60.0))
        CGContextStrokeRectWithWidth(context, CGRectMake(30.0, 280.0, 60.0, 60.0), 10.0)
        CGContextSaveGState(context);
        UIColor.redColor().setStroke()
        CGContextStrokeRectWithWidth(context, CGRectMake(30.0, 280.0, 60.0, 60.0), 2.0);
        CGContextRestoreGState(context);
        let rects =
            [
                CGRectMake(120.0, 100.0, 60.0, 60.0),
                CGRectMake(120.0, 190.0, 60.0, 60.0),
                CGRectMake(120.0, 280.0, 60.0, 60.0)
            ]
        let count:UInt = (UInt)(rects.count)
        CGContextAddRects(context, rects, count)
        CGContextStrokePath(context)
        CGContextAddRect(context, CGRectMake(210.0, 100.0, 60.0, 60.0));
        CGContextFillPath(context);
        CGContextFillRect(context, CGRectMake(210.0, 190.0, 60.0, 60.0))
    }
}