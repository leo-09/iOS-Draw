//
//  ViewController.m
//  JqllyRefresh
//
//  Created by liyy on 16/11/29.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import "ViewController.h"
#import "JqllyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    JqllyView *view = [[JqllyView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
}

@end
