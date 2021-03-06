//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Jonathan on 2017/8/31.
//  Copyright © 2017年 China UnionPay. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView ()

@property (nonatomic, strong) UIColor *circleColor;

@end

@implementation BNRHypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return  self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI*2.0 clockwise:YES];
    }
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [path stroke];
    
//    第四章高级练习，绘制颜色渐变的三角形
//    UIBezierPath *myPath = [[UIBezierPath alloc] init];
//    CGPoint topPoint = CGPointMake(center.x, 80);
//    CGPoint leftPoint = CGPointMake(center.x - 120, 600);
//    CGPoint rightPoitn = CGPointMake(center.x + 120, 600);
//    [myPath moveToPoint:topPoint];
//    [myPath addLineToPoint:leftPoint];
//    [myPath addLineToPoint:rightPoitn];
//    [myPath closePath];
//
//    CGContextRef content = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(content); //保存绘图状态
//    [myPath addClip];
//
//    CGFloat location[2] = {0.0,1.0};
//    CGFloat components[8] = {0.0,1.0,0.0,1.0,1.0,1.0,0.0,1.0};
//    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
//    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, location, 2);
//    CGPoint startPoint = CGPointMake(100, 50);
//    CGPoint endPoint = CGPointMake(100, 500);
//    CGContextDrawLinearGradient(content, gradient, startPoint, endPoint, 0);
//    CGGradientRelease(gradient);
//    CGColorSpaceRelease(colorspace);
//
//    CGContextRestoreGState(content); //恢复绘图状态
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched",self);
    float red = arc4random() % 100 / 100.0;
    float green = arc4random() % 100 / 100.0;
    float blue = arc4random() % 100 / 100.0;
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    self.circleColor = randomColor;
    [self setNeedsDisplay];
}

@end
