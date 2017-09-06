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

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@",date);
}


@end

