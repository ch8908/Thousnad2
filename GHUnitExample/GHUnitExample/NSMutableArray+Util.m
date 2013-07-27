//
// Created by Huang ChienShuo on 7/21/13.
// Copyright (c) 2013 ThousandSquare. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSMutableArray+Util.h"


@implementation NSMutableArray(Util)

- (void) nm_reverse
{
    const NSUInteger arrayCount = [self count];
    if (arrayCount == 0 || arrayCount == 1)
    {
        return;
    }
    NSInteger i = 0;
    NSInteger j = arrayCount - 1;
    while (i < j)
    {
        [self exchangeObjectAtIndex:i
                  withObjectAtIndex:j];

        i++;
        j--;
    }
}

@end