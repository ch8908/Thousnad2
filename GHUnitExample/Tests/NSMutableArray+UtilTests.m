//
//  PrettyFormatterTests.m
//  GHUnitExample
//
//  Created by Huang ChienShuo on 7/7/13.
//  Copyright (c) 2013 ThousandSquare. All rights reserved.
//

// For iOS
#import <GHUnitIOS/GHUnit.h>
#import "NSMutableArray+Util.h"


@interface NSMutableArray_Util : GHTestCase
{}
@end

@implementation NSMutableArray_Util

- (BOOL) shouldRunOnMainThread
{
    // By default NO, but if you have a UI test or test dependent on running on the main thread return YES.
    // Also an async test that calls back on the main thread, you'll probably want to return YES.
    return NO;
}

- (void) setUpClass
{
    // Run at start of all tests in the class
}

- (void) tearDownClass
{
    // Run at end of all tests in the class
}

- (void) setUp
{
    // Run before each test method
}

- (void) tearDown
{
    // Run after each test method
}

- (void) testReverse
{
    NSMutableArray* mutableArray = [NSMutableArray array];
    [mutableArray nm_reverse];
    GHAssertEquals((NSUInteger) 0, mutableArray.count, @"");

    [mutableArray addObject:@"1"];
    [mutableArray nm_reverse];
    GHAssertEquals((NSUInteger) 1, mutableArray.count, @"");
    GHAssertEqualStrings(@"1", mutableArray[0], @"");

    [mutableArray addObject:@"2"];
    [mutableArray addObject:@"3"];
    [mutableArray addObject:@"4"];
    [mutableArray nm_reverse];
    GHAssertEquals((NSUInteger) 4, mutableArray.count, @"");
    GHAssertEqualStrings(@"4", mutableArray[0], @"");
    GHAssertEqualStrings(@"3", mutableArray[1], @"");
    GHAssertEqualStrings(@"1", mutableArray[3], @"");

    [mutableArray removeAllObjects];
    for (int i = 0; i < 100; i++)
    {
        [mutableArray addObject:[NSString stringWithFormat:@"%i", i]];
    }
    [mutableArray nm_reverse];
    for (int i = 0; i < 100; i++)
    {
        NSString* const expect = [NSString stringWithFormat:@"%i", i];
        GHAssertEqualStrings(expect, [mutableArray objectAtIndex:99 - i], @"");
    }
}

@end