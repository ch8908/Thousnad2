//
// Created by Kros on 1/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PasscodeLockWindow.h"
#import "PasscodeDataController.h"
#import "VerifyPasscodeViewController.h"


@interface PasscodeLockWindow()
@property (nonatomic, readwrite, retain) UIWindow* window;
@property (nonatomic, readwrite, retain) PasscodeDataController* userPreference;

@end

@implementation PasscodeLockWindow
@synthesize window = _window;
@synthesize userPreference = _userPreference;


- (void) dealloc
{
    [_window release];
    [_userPreference release];
    [super dealloc];
}

- (id) initPasscodeLockWindow
{
    self = [super init];
    if (self)
    {
        //TODO check passcodeLock enable
        _userPreference = [[PasscodeDataController alloc] init];
        if ([_userPreference getPasscode])
        {
            [self createWindow];
        }

    }
    return self;
}

- (void) createWindow
{
    if (self.window)
    {
        return;
    }
    self.window = [[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds] autorelease];
    self.window.windowLevel = UIWindowLevelAlert + 2;
    __block PasscodeLockWindow* preventCircularRef = self;
    VerifyPasscodeViewController* passcodeLockViewController = [[[VerifyPasscodeViewController alloc] initVerify:^{
        [preventCircularRef hide];
    }] autorelease];
   self.window.rootViewController = passcodeLockViewController;
    self.window.hidden = YES;
}

- (void) show
{
    if (![self.userPreference getPasscode])
    {
        return;
    }
    [self createWindow];
    self.window.hidden = NO;
}

- (void) hide
{
    self.window = nil;
}

@end