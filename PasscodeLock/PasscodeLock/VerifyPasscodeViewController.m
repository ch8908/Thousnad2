//
// Created by Kros on 1/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "VerifyPasscodeViewController.h"
#import "PasscodeDataController.h"

@interface VerifyPasscodeViewController()
@property (nonatomic, readwrite, retain) PasscodeDataController* userPreference;
@property (nonatomic, readonly, copy) CompletionBlock complete;
@end

@implementation VerifyPasscodeViewController
@synthesize userPreference = _userPreference;
@synthesize complete = _complete;


- (void) dealloc
{
    [_userPreference release];
    [_complete release];
    [super dealloc];
}

- (id)initVerify:(CompletionBlock) complete
{
    self = [super init];
    if (self)
    {
        _userPreference = [[PasscodeDataController alloc] initPasscodeData];
        _complete = [complete copy];
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Verify Passcode"];
    [self.noticeLabel setText:@"Input passcode to unlock"];
}

- (void) onFilled:(NSString*) result
{
    NSString* passcode = [self.userPreference getPasscode];
    if ([result isEqualToString:passcode])
    {
        self.complete();
    }
    [self updateNotice:@"Passcode Error"];
    [self clearPasscode];
}

@end