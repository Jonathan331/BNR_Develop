//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Jonathan on 2017/9/6.
//  Copyright © 2017年 China UnionPay. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Reminder";
        self.tabBarItem.image = [UIImage imageNamed:@"Time.png"];
    }
    return  self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"BNRReminderViewController loaded its view.");
}

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@",date);
}


@end

