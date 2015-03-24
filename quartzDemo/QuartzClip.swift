//
//  QuartzClip.swift
//  quartzDemo
//
//  Created by lkk on 15-3-23.
//  Copyright (c) 2015年 LKK. All rights reserved.
//

import UIKit

class QuartzClip: UIView {
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let height = self.bounds.size.height
        CGContextTranslateCTM(context, 0.0, height)
        CGContextScaleCTM(context, 1.0, -1.0)
        UIColor.redColor().setFill()
        CGContextSaveGState(context)
        CGContextDrawImage(context, CGRectMake(10.0,height-170, 90.0, 90.0), self.image())
        let clips =
            [
                CGRectMake(110.0, height - 170.0, 35.0, 90.0),
                CGRectMake(165.0, height - 170.0, 35.0, 90.0)
            ]
        CGContextClipToRects(context, clips, 2)
        CGContextDrawImage(context, CGRectMake(110.0, height - 170.0, 90.0, 90.0), self.image());
        CGContextRestoreGState(context);
        self.addStarToContext(context, center: CGPointMake(55.0, height - 220.0) , radius: 45.0, angle: 0.0)
        CGContextSaveGState(context)
        CGContextClip(context)
        CGContextFillRect(context, CGRectMake(10.0, height - 260.0, 90.0, 90.0))
        CGContextDrawImage(context, CGRectMake(10.0, height - 260.0, 90.0, 90.0), self.image())
        CGContextRestoreGState(context)
        CGContextSaveGState(context)
        self.addStarToContext(context, center: CGPointMake(155.0, height - 220.0), radius: 45.0, angle: 0.0)
        CGContextEOClip(context)
        CGContextFillRect(context, CGRectMake(110.0, height - 260.0, 90.0, 90.0))
        CGContextDrawImage(context, CGRectMake(110.0, height - 260.0, 90.0, 90.0), self.image());
        CGContextRestoreGState(context)
        self.addStarToContext(context, center: CGPointMake(255.0, height - 220.0), radius: 45.0, angle: 0.0)
        CGContextAddRect(context, CGRectMake(210.0, height - 260.0, 90.0, 90.0))
        CGContextSaveGState(context)
        CGContextEOClip(context)
        CGContextFillRect(context, CGRectMake(210.0, height - 260.0, 90.0, 90.0))
        CGContextDrawImage(context, CGRectMake(210.0, height - 260.0, 90.0, 90.0), self.image())
        CGContextRestoreGState(context)
    }
    func addStarToContext(context:CGContextRef,center:CGPoint,radius:CGFloat,angle:CGFloat){
        let angleX = (Float)(M_PI) * (Float)(angle) / 5.0
        let angleY = (Float)(M_PI) * (Float)(angle) / 5.0
        let x = radius * (CGFloat)(sinf(angleX)) + center.x
        let y = radius * (CGFloat)(cosf(angleY)) + center.y;
        CGContextMoveToPoint(context, x, y);
        for(var i = 1; i < 5; ++i)
        {
            let angleXx = ((Float)(M_PI) * (Float)(i) * 4.0  + (Float)(angle)) / 5.0
            let angleYy = ((Float)(M_PI) * (Float)(i) * 4.0 + (Float)(angle)) / 5.0
            let xx = radius * (CGFloat)(sinf(angleXx)) + center.x

            let yy = radius * (CGFloat)(cosf(angleYy)) + center.y;
            CGContextAddLineToPoint(context, xx, yy);
        }
        CGContextClosePath(context);
       
    }
    func image() -> CGImage{
        let imagePath = NSBundle.mainBundle().pathForResource("Ship", ofType: "png")
        let img = UIImage(contentsOfFile: imagePath!)
        return img!.CGImage
    }
}
class Mask:UIView {
 
    
    var alphaImage:CGImageRef!
    var maskingImage:CGImageRef!
    func createImages(){
        let image = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Ship", ofType: "png")!)
        alphaImage = image!.CGImage
        var data = NSMutableData(length: 90 * 90 * 1)
        let temp:CGBitmapInfo = CGBitmapInfo(7)
        let context = CGBitmapContextCreate(data!.mutableBytes, 90, 90, 8, 90, nil, temp)
        CGContextSetBlendMode(context, kCGBlendModeCopy)
        CGContextDrawImage(context, CGRectMake(0.0, 0.0, 90.0, 90.0), self.alphaImage)
        let dataProvider = CGDataProviderCreateWithCFData(data)
        maskingImage = CGImageMaskCreate(90, 90, 8, 8, 90, dataProvider, nil, true)
    }
    override func drawRect(rect: CGRect) {
        self.createImages()
        let context = UIGraphicsGetCurrentContext()
        let height = self.bounds.size.height
        CGContextTranslateCTM(context, 0.0, height)
        CGContextScaleCTM(context, 1.0, -1.0)
        CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0)
        CGContextSaveGState(context)
        CGContextClipToMask(context, CGRectMake(10.0, height - 170.0, 90.0, 90.0), self.alphaImage)
        CGContextFillRect(context, self.bounds);
        CGContextRestoreGState(context);
        CGContextSaveGState(context);
        CGContextClipToMask(context, CGRectMake(110.0, height - 260.0, 180.0, 180.0), self.alphaImage);
        CGContextFillRect(context, self.bounds);
        CGContextRestoreGState(context);
        CGContextSaveGState(context);
        CGContextClipToMask(context, CGRectMake(10.0, height - 300.0, 90.0, 90.0), self.maskingImage);
        CGContextFillRect(context, self.bounds);
        CGContextRestoreGState(context);
        CGContextSaveGState(context);
        CGContextClipToMask(context, CGRectMake(10.0, height - 300.0, 90.0, 90.0), self.maskingImage);
        CGContextFillRect(context, self.bounds);
        CGContextRestoreGState(context);
        CGContextSaveGState(context);
        CGContextClipToMask(context, CGRectMake(110.0, height - 460.0, 180.0, 180.0), self.maskingImage);
        CGContextFillRect(context, self.bounds)
        CGContextRestoreGState(context)

    }
}