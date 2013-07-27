//
//  PrettyFormatterTests.m
//  GHUnitExample
//
//  Created by Huang ChienShuo on 7/7/13.
//  Copyright (c) 2013 ThousandSquare. All rights reserved.
//

// For iOS
#import <GHUnitIOS/GHUnit.h>
#import "PrettyFormatter.h"


@interface PrettyFormatterTests : GHTestCase
{}
@end

@implementation PrettyFormatterTests

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

- (void) testTwitterFormatter
{
    NSDate* now = [NSDate date];
    GHAssertEqualStrings(@"0s", [PrettyFormatter twitterFormat:[now dateByAddingTimeInterval:0]], @"");
    GHAssertEqualStrings(@"3s", [PrettyFormatter twitterFormat:[now dateByAddingTimeInterval:-3]], @"");
    GHAssertEqualStrings(@"30s", [PrettyFormatter twitterFormat:[now dateByAddingTimeInterval:-30]], @"");
    GHAssertEqualStrings(@"5m", [PrettyFormatter twitterFormat:[now dateByAddingTimeInterval:-60 * 5]], @"");
    GHAssertEqualStrings(@"23h", [PrettyFormatter twitterFormat:[now dateByAddingTimeInterval:-3600 * 23]], @"");

    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"d MMM"];

    NSTimeInterval oneDayAgo = -3600 * 24;
    NSTimeInterval tenDaysAgo = -3600 * 24 * 10;

    GHAssertEqualStrings([formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:oneDayAgo]],
    [PrettyFormatter twitterFormat:[now dateByAddingTimeInterval:oneDayAgo]], @"");

    GHAssertEqualStrings([formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:tenDaysAgo]],
    [PrettyFormatter twitterFormat:[now dateByAddingTimeInterval:tenDaysAgo]], @"");

    GHAssertEqualStrings(@"1y", [PrettyFormatter twitterFormat:[now dateByAddingTimeInterval:-3600 * 24 * 365]], @"");
    GHAssertEqualStrings(@"10y", [PrettyFormatter twitterFormat:[now dateByAddingTimeInterval:-3600 * 24 * 365 * 11]], @"");
}

- (void) testFacebookFormatter
{
    NSDate* now = [NSDate date];
    GHAssertEqualStrings(@"Just now", [PrettyFormatter facebookFormat:[now dateByAddingTimeInterval:0]], @"");
    GHAssertEqualStrings(@"Just now", [PrettyFormatter facebookFormat:[now dateByAddingTimeInterval:2]], @"");
    GHAssertEqualStrings(@"3 seconds ago", [PrettyFormatter facebookFormat:[now dateByAddingTimeInterval:-3]], @"");
    GHAssertEqualStrings(@"30 seconds ago", [PrettyFormatter facebookFormat:[now dateByAddingTimeInterval:-30]], @"");
    GHAssertEqualStrings(@"1 minute ago", [PrettyFormatter facebookFormat:[now dateByAddingTimeInterval:-60 * 1]], @"");
    GHAssertEqualStrings(@"5 minutes ago", [PrettyFormatter facebookFormat:[now dateByAddingTimeInterval:-60 * 5]], @"");
    GHAssertEqualStrings(@"55 minutes ago", [PrettyFormatter facebookFormat:[now dateByAddingTimeInterval:-60 * 55]], @"");
    GHAssertEqualStrings(@"1 hour ago", [PrettyFormatter facebookFormat:[now dateByAddingTimeInterval:-3600 * 1]], @"");
    GHAssertEqualStrings(@"23 hours ago", [PrettyFormatter facebookFormat:[now dateByAddingTimeInterval:-3600 * 23]], @"");
    GHAssertEqualStrings(@"Yesterday", [PrettyFormatter facebookFormat:[now dateByAddingTimeInterval:-3600 * 24]], @"");

    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"EEEE 'at' HH:mm"];

    NSTimeInterval fiveDaysAgo = -3600 * 24 * 5;

    GHAssertEqualStrings([formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:fiveDaysAgo]],
    [PrettyFormatter facebookFormat:[now dateByAddingTimeInterval:fiveDaysAgo]], @"");

    GHAssertEqualStrings(@"1 year ago", [PrettyFormatter facebookFormat:[now dateByAddingTimeInterval:-3600 * 24 * 365]], @"");
    GHAssertEqualStrings(@"10 years ago", [PrettyFormatter facebookFormat:[now dateByAddingTimeInterval:-3600 * 24 * 365 * 11]], @"");
}

@end