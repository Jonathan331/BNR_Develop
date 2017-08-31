//
//  BNRItem.m
//  RandomItems
//
//  Created by Jonathan on 2017/8/24.
//  Copyright © 2017年 Jonathan. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype)randomItem
{
    NSArray *randomAdjectiveList = @[@"Flurry",@"Rusty",@"Shiny"];
    NSArray *randomNounList = @[@"Bear",@"Spork",@"Mac"];
    NSInteger adjectiveIndex = arc4random() % randomAdjectiveList.count;
    NSInteger nounIndex = arc4random() % randomNounList.count;
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",[randomAdjectiveList objectAtIndex:adjectiveIndex],[randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = arc4random() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0'+arc4random() % 10,
                                    'A'+arc4random() % 26,
                                    '0'+arc4random() % 10,
                                    'A'+arc4random() % 26,
                                    '0'+arc4random() % 10];
    BNRItem *item = [[self alloc] initWithItemName:randomName valueInDollar:randomValue serialNumber:randomSerialNumber];
    return item;
}

- (instancetype)initWithItemName:(NSString *)name valueInDollar:(int)value serialNumber:(NSString *)sNumber
{
    self = [super init];
    if (self) {
        _itemName = name;
        _valueInDollar = value;
        _serialNumber = sNumber;
        
        _dateCreated = [[NSDate alloc] init];
    }
    return self;
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollar:0 serialNumber:@""];
}

- (NSString *)description
{
    NSString *description = [[NSString alloc] initWithFormat:@"%@ (%@) : worth $%d, recorded on %@",self.itemName,self.serialNumber,self.valueInDollar,self.dateCreated];
    return description;
}

@end
