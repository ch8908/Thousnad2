//
// Created by Kros on 1/26/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ChangePasscodeViewController.h"
#import "PasscodeDataController.h"

@interface ChangePasscodeViewController()
@property (nonatomic, readonly, retain) PasscodeDataController* userPreference;
@property (nonatomic, readwrite, retain) NSString* passcode;
@end

@implementation ChangePasscodeViewController
@synthesize userPreference = _userPreference;
@synthesize passcode = _passcode;


- (void) dealloc
{
    [_userPreference release];
    [_passcode release];
    [super dealloc];
}

- (id) initChangePasscode
{
    self = [super init];
    if (self)
    {
        _userPreference = [[PasscodeDataController alloc] initPasscodeData];
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Change Passcode"];
}


- (void) onFilled:(NSString*) result
{
    if (!self.passcode)
    {
        self.passcode = result;
        [self clearAndUpdateNotice:@"Input passcode again"];
    }
    else
    {
        if ([self.passcode isEqualToString:result])
        {
            [self.userPreference setPasscode:result];
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            self.passcode = nil;
            [self clearAndUpdateNotice:@"Wrong passcode, input again"];
        }
    }
}

@end