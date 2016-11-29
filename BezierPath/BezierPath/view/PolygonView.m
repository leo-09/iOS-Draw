//
//  PolygonView.m
//  BezierPath
//
//  Created by liyy on 16/11/28.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import "PolygonView.h"

#define pi 3.14159265359
#define DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)

@implementation PolygonView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIColor *color = [UIColor greenColor];
    [color set];
    
//    //  ↓↓↓↓↓↓↓↓↓↓  创建一个五边形  ↓↓↓↓↓↓↓↓↓↓
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    path.lineWidth = 3.0;
//    
//    path.lineCapStyle = kCGLineCapButt;
//    path.lineJoinStyle = kCGLineCapRound;
//    
//    [path moveToPoint:CGPointMake(100.0, 10.0)];
//    
//    [path addLineToPoint:CGPointMake(200.0, 40.0)];
//    [path addLineToPoint:CGPointMake(160.0, 140.0)];
//    [path addLineToPoint:CGPointMake(40.0, 140.0)];
//    [path addLineToPoint:CGPointMake(0.0, 40.0)];
//    [path closePath];
//
//    [path stroke];
//    [path fill];
//    //  ↑↑↑↑↑↑↑↑↑↑  创建一个五边形  ↑↑↑↑↑↑↑↑↑↑
    
//    //  ↓↓↓↓↓↓↓↓↓↓  创建矩形  ↓↓↓↓↓↓↓↓↓↓
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(30, 40, 100, 70)];
//    path.lineWidth = 2.0;
//    path.lineCapStyle = kCGLineCapRound;
//    path.lineJoinStyle = kCGLineCapRound;
//    [path stroke];
//    [path fill];
//    //  ↑↑↑↑↑↑↑↑↑↑  创建矩形  ↑↑↑↑↑↑↑↑↑↑
    
//    //  ↓↓↓↓↓↓↓↓↓↓  创建圆形或者椭圆形  ↓↓↓↓↓↓↓↓↓↓
//    CGRect r = CGRectMake(10, 60, 300, 200);
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:r];
//    [path stroke];
//    //  ↑↑↑↑↑↑↑↑↑↑  创建圆形或者椭圆形  ↑↑↑↑↑↑↑↑↑↑
    
//    //  ↓↓↓↓↓↓↓↓↓↓  创建一段弧线  ↓↓↓↓↓↓↓↓↓↓
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:30 startAngle:0 endAngle:DEGREES_TO_RADIANS(170) clockwise:YES];
//    [path stroke];
//    [path fill];
//    //  ↑↑↑↑↑↑↑↑↑↑  创建一段弧线  ↑↑↑↑↑↑↑↑↑↑
    
//    //  ↓↓↓↓↓↓↓↓↓↓  绘制二次贝塞尔曲线  ↓↓↓↓↓↓↓↓↓↓
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    path.lineWidth = 3.0;
//    [path moveToPoint:CGPointMake(40, 100)];
//    [path addQuadCurveToPoint:CGPointMake(80, 120) controlPoint:CGPointMake(50, 300)];
//    [path fill];
//    //  ↑↑↑↑↑↑↑↑↑↑  绘制二次贝塞尔曲线  ↑↑↑↑↑↑↑↑↑↑
    
//    //  ↓↓↓↓↓↓↓↓↓↓  绘制三次贝塞尔曲线  ↓↓↓↓↓↓↓↓↓↓
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(20, 50)];
//    [path addCurveToPoint:CGPointMake(200, 50) controlPoint1:CGPointMake(110, 0) controlPoint2:CGPointMake(110, 110)];
//    [path stroke];
//    //  ↑↑↑↑↑↑↑↑↑↑  绘制三次贝塞尔曲线  ↑↑↑↑↑↑↑↑↑↑
    
//    //  ↓↓↓↓↓↓↓↓↓↓  使用Core Graphics函数去修改path  ↓↓↓↓↓↓↓↓↓↓
//    CGMutablePathRef cgPath = CGPathCreateMutable();
//    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(0, 10, 300, 300));
//    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(50, 60, 200, 200));
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    path.CGPath = cgPath;
//    path.usesEvenOddFillRule = YES;
//    [path stroke];
//    CGPathRelease(cgPath);
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 300, 300)];
//    CGPathRef cgPath = path.CGPath;
//    CGMutablePathRef mutablePath = CGPathCreateMutableCopy(cgPath);
//    CGPathAddEllipseInRect(mutablePath, NULL, CGRectMake(50, 50, 200, 200));
//    CGAffineTransform m = CGAffineTransformMakeRotation(10);
//    CGPathAddEllipseInRect(mutablePath, &m, CGRectMake(50, 50, 100, 200));
//    path.CGPath = mutablePath;
//    [path stroke];
//    //  ↑↑↑↑↑↑↑↑↑↑  使用Core Graphics函数去修改path  ↑↑↑↑↑↑↑↑↑↑
    
    //  ↓↓↓↓↓↓↓↓↓↓  rendering（渲染）Bezier Path对象的内容  ↓↓↓↓↓↓↓↓↓↓
    // Create an oval shape to draw.
    UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 100)];
    // Set the render colors
    [[UIColor yellowColor] setStroke];
//    [[UIColor redColor] setFill];
    
    CGContextRef aRef = UIGraphicsGetCurrentContext();

    // If you have content to draw after the shape,
    // save the current state before changing the transform
    //CGContextSaveGState(aRef);
    
    // Adjust the view's origin temporarily. The oval is
    // now drawn relative to the new origin point.
    CGContextTranslateCTM(aRef, 50, 50);
    
    // Adjust the drawing options as needed.
    aPath.lineWidth = 5;
    
    // Fill the path before stroking it so that the fill
    // color does not obscure the stroked line.
//    [aPath fill];
    [aPath stroke];
    
    // Restore the graphics state before drawing any other content.
    //CGContextRestoreGState(aRef);
    //  ↑↑↑↑↑↑↑↑↑↑  rendering（渲染）Bezier Path对象的内容  ↑↑↑↑↑↑↑↑↑↑
}

@end
