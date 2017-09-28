//
//  RedDotViewController.m
//  UIDemo
//
//  Created by Jonathan on 2017/9/27.
//  Copyright © 2017年 China UnionPay. All rights reserved.
//

#import "RedDotViewController.h"

@interface RedDotViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation RedDotViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.array = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i++) {
            NSInteger index = arc4random() % 200;
            NSString *stringIndex = [NSString stringWithFormat:@"%ld",index];
            [self.array addObject:stringIndex];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableview];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowInSection:(NSInteger)section
{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    CGSize size = [self.array[indexPath.row] fixSizeWithFont:[UIFont systemFontOfSize:24]];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 5, 20, 20)];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 10;
    label.backgroundColor = [UIColor redColor];
    label.text = self.array[indexPath.row];
    label.font = [UIFont systemFontOfSize:10 weight:0.7];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:label];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
