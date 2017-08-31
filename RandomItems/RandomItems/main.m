//
//  main.m
//  RandomItems
//
//  Created by Jonathan on 2017/8/24.
//  Copyright © 2017年 Jonathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSMutableArray *items = [[NSMutableArray alloc] init];

        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        
        for (BNRItem *item in items)
        {
            NSLog(@"%@", item);
        }
        
        items = nil;
        
    }
    return 0;
}
