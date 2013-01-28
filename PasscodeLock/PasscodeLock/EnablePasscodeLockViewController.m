//
// Created by Kros on 1/2/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "EnablePasscodeLockViewController.h"
#import "PasscodeDataController.h"

@interface EnablePasscodeLockViewController()
@property (nonatomic, readwrite, copy) NSString* password;
@property (nonatomic, readonly, retain) PasscodeDataController* userPreference;
@end

@implementation EnablePasscodeLockViewController
@synthesize password = _password;
@synthesize userPreference = _userPreference;


- (void) dealloc
{
    [_password release];
    [_userPreference release];
    [super dealloc];
}

- (id) initEnablePasscodeLock
{
    self = [super init];
    if (self)
    {
        _userPreference = [[PasscodeDataController alloc] initPasscodeData];
    }
    return self;
}

- (id)init
{
    return [self initEnablePasscodeLock];
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Ceate Passcode"];
}

- (void) onFilled:(NSString*) result
{
    if (self.password)
    {
        if ([self.password isEqualToString:result])
        {
            [self updateNotice:@"Create success."];
            [self.userPreference setPasscode:self.password];
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            [self clearAndUpdateNotice:@"Wrong passcode."];
            self.password = nil;
        }
    }
    else
    {
        self.password = result;
        [self clearAndUpdateNotice:@"Input again."];
    }
}

@end