//
//  ViewController.m
//  BezierPath
//
//  Created by liyy on 16/11/28.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import "ViewController.h"
#import "PolygonView.h"

@interface ViewController ()

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
