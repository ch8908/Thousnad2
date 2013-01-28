//
// Created by Kros on 1/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PasscodeDataController.h"

NSString* const PasscodeLockPasscodeKey = @"PasscodeLockPasscodeKey";

@implementation PasscodeDataController

- (id)initPasscodeData
{
    self = [super init];
    if (self)
    {

    }
    return self;
}

- (id)init
{
    return [self initPasscodeData];
}

- (void)setPasscode:(NSString* )passcode
{
    [[NSUserDefaults standardUserDefaults] setValue:passcode forKey:PasscodeLockPasscodeKey];
}

- (NSString* )getPasscode
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:PasscodeLockPasscodeKey];
}

@end