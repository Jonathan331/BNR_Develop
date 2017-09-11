//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Jonathan on 2017/9/6.
//  Copyright © 2017年 China UnionPay. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        self.tabBarItem.image = [UIImage imageNamed:@"Hypno.png"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewA will appear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewA did appear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewA will disappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"viewA did disappear");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"BNRHypnosisViewController loaded its view.");
}

- (void)loadView
{
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    self.view = backgroundView;
}

@end
