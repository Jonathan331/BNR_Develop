//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Jonathan on 2017/9/6.
//  Copyright © 2017年 China UnionPay. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController()<UITextFieldDelegate>

@end

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
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 70, 295, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    [backgroundView addSubview:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 20; i++) {
        UILabel *label = [[UILabel alloc] init];
        
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.text = message;
        
        [label sizeToFit];
        
        int width = (int)(self.view.bounds.size.width - label.bounds.size.width);
        int x = arc4random() % width;
        
        int height = (int)(self.view.bounds.size.height - label.bounds.size.height);
        int y = arc4random() % height;
        
        CGRect frame = label.frame;
        frame.origin = CGPointMake(x, y);
        label.frame = frame;
        
        [self.view addSubview:label];
        
        //视差效果
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [label addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [label addMotionEffect:motionEffect];
    }
}

@end
