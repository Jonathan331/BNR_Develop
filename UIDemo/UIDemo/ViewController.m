//
//  ViewController.m
//  UIDemo
//
//  Created by Jonathan on 2017/9/27.
//  Copyright © 2017年 China UnionPay. All rights reserved.
//

#import "ViewController.h"
#import "RedDotViewController.h"

typedef void(^ExecuteBlock)(void);

@interface CellSource : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) ExecuteBlock execute;
@end
@implementation CellSource
@end

@interface ViewController ()
@property (nonatomic, copy) NSArray <CellSource *>* sourceArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:({
        CellSource *source = [[CellSource alloc] init];
        source.name = @"红点提示";
        source.execute = ^{
            RedDotViewController *vc = [[RedDotViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        };
        source;
    })];
    self.sourceArray = [array copy];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = self.sourceArray[indexPath.row].name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.sourceArray[indexPath.row].execute();
}
@end
