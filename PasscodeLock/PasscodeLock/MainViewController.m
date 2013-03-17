//
// Created by Kros on 12/24/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MainViewController.h"
#import "SwitchCell.h"
#import "EnablePasscodeLockViewController.h"
#import "PasscodeDataController.h"
#import "ChangePasscodeViewController.h"


typedef enum
{
    SectionEnablePasscodeLock = 0,
    SectionChangePassword,
    SectionShowAlert,
    SectionShowActionSheet,
    TotalSectionCount
} Section;

@interface MainViewController()<UIActionSheetDelegate>
@property (nonatomic, readonly, retain) SwitchCell* passcodeLockSwitchCell;
@property (nonatomic, readwrite, assign) BOOL enablePasscodeLock;
@property (nonatomic, readonly, retain) PasscodeDataController* userPreference;
@end

@implementation MainViewController
@synthesize passcodeLockSwitchCell = _passcodeLockSwitchCell;
@synthesize enablePasscodeLock = _enablePasscodeLock;
@synthesize userPreference = _userPreference;


- (void) dealloc
{
    [_passcodeLockSwitchCell release];
    [_userPreference release];
    [super dealloc];
}

- (id) init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self)
    {
        _passcodeLockSwitchCell = [[SwitchCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                    reuseIdentifier:@"SwitchCellEnablePassLock"];

        _passcodeLockSwitchCell.textLabel.text = @"Passcode Lock";
        [_passcodeLockSwitchCell.switchView addTarget:self
                                               action:@selector(onSwitch:)
                                     forControlEvents:UIControlEventValueChanged];

        _userPreference = [[PasscodeDataController alloc] initPasscodeData];
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void) viewDidAppear:(BOOL) animated
{
    [super viewDidAppear:animated];
    [self refresh];
}

- (void)refresh
{
    self.enablePasscodeLock = [[self.userPreference getPasscode] boolValue];
    if (self.enablePasscodeLock)
    {

    }
    [self.tableView reloadData];
}

- (void) onSwitch:(UISwitch*) sender
{
    if (sender.isOn)
    {
        EnablePasscodeLockViewController* viewController = [[[EnablePasscodeLockViewController alloc] init] autorelease];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else
    {
        [self.userPreference setPasscode:nil];
        [self refresh];
    }
}

- (void) onChangePasscode
{
    ChangePasscodeViewController* viewController = [[[ChangePasscodeViewController alloc] initChangePasscode] autorelease];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (NSInteger) tableView:(UITableView*) tableView numberOfRowsInSection:(NSInteger) section
{
    return 1;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView*) tableView
{
    return TotalSectionCount;
}

- (NSString*) tableView:(UITableView*) tableView titleForFooterInSection:(NSInteger) section
{
    switch (section)
    {
        case SectionEnablePasscodeLock:
            return @"Turn on/off passcode lock";
        case SectionChangePassword:
            return @"Change password";
        case SectionShowAlert:
            return @"Show an alert view for test";
        case SectionShowActionSheet:
            return @"Show Action Sheet for test";
        default:
            return @"";
    }
}

- (UITableViewCell*) tableView:(UITableView*) tableView cellForRowAtIndexPath:(NSIndexPath*) indexPath
{
    static NSString* cellIdentifier = @"CellIdentifier";

    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:cellIdentifier] autorelease];
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor blackColor];
    cell.userInteractionEnabled = YES;

    switch (indexPath.section)
    {
        case SectionEnablePasscodeLock:
        {
            if ([self.userPreference getPasscode])
            {
                self.enablePasscodeLock = YES;
            }
            [self.passcodeLockSwitchCell.switchView setOn:self.enablePasscodeLock animated:NO];
            return self.passcodeLockSwitchCell;
        }
        case SectionChangePassword:
        {
            if (![self.userPreference getPasscode])
            {
                cell.textLabel.textColor = [UIColor lightGrayColor];
                cell.userInteractionEnabled = NO;
            }
            cell.textLabel.text = @"Change passcode";
            return cell;
        }
        case SectionShowAlert:
        {
            cell.textLabel.text = @"Show alert";
            return cell;
        }
        case SectionShowActionSheet:
        {
            cell.textLabel.text = @"Show Action Sheet";
            return cell;
        }
        default:
            return cell;
    }
}

- (void) tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath*) indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section)
    {
        case SectionChangePassword:
            [self onChangePasscode];
            return;
        case SectionShowAlert :
            [self showAlertView];
            return;
        case SectionShowActionSheet:
            [self showActionSheet];
        default:
            return;
    }
}

- (void) showActionSheet
{
    UIActionSheet* actionSheet = [[[UIActionSheet alloc] initWithTitle:@"Action Sheet"
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                destructiveButtonTitle:nil otherButtonTitles:@"test1", @"test2",
                                                                                             nil] autorelease];
    [actionSheet showInView:self.view];
}

- (void) showAlertView
{
    UIAlertView* alertView = [[[UIAlertView alloc] initWithTitle:@"Alert View" message:@"For test"
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil] autorelease];
    [alertView show];
}

@end