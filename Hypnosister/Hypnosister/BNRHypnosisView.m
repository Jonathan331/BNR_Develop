//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Jonathan on 2017/8/31.
//  Copyright © 2017年 China UnionPay. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    float radius = (MIN(bounds.size.width, bounds.size.height)) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI*2.0 clockwise:YES];
    path.lineWidth = 1;
    [path stroke];
}

@end
