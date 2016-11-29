//
//  ViewController.m
//  BezierPath
//
//  Created by liyy on 16/11/28.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import "ViewController.h"
#import "PolygonView.h"

@interface ViewController () {
    CAShapeLayer *sl;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    PolygonView *view = [[PolygonView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    
    [self addCAShapeLayer];
    [self circleShapeLayer];
}

- (void) addCAShapeLayer {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, 200, 200);
    shapeLayer.position = self.view.center;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    shapeLayer.lineWidth = 1.0f;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.lineCap = @"square";
    
    //设置stroke起始点
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd = 0.7;
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];
    shapeLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
}

- (void) circleShapeLayer {
    sl = [CAShapeLayer layer];
    sl.frame = CGRectMake(0, 0, 150, 150);
    sl.position = self.view.center;
    sl.fillColor = [UIColor clearColor].CGColor;
    
    sl.lineWidth = 4.0f;
    sl.strokeColor = [UIColor greenColor].CGColor;
    
    //设置stroke起始点
    sl.strokeStart = 0;
    sl.strokeEnd = 0;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 150, 150)];
    sl.path = path.CGPath;
    
    [self.view.layer addSublayer:sl];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(circleAnimationTypeOne) userInfo:nil repeats:YES];
}

- (void) circleAnimationTypeOne {
    if (sl.strokeEnd > 1 && sl.strokeStart < 1) {
        sl.strokeStart += 0.1;
    }else if(sl.strokeStart == 0){
        sl.strokeEnd += 0.1;
    }
    
    if (sl.strokeEnd == 0) {
        sl.strokeStart = 0;
    }
    
    if (sl.strokeStart == sl.strokeEnd) {
        sl.strokeEnd = 0;
    }
}

@end
