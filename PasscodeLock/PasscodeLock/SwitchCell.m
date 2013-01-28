//
// Created by Kros on 12/24/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SwitchCell.h"

@implementation SwitchCell
@synthesize switchView = _switchView;

- (void) dealloc
{
    [_switchView release];
    [super dealloc];
}

- (id) initWithStyle:(UITableViewCellStyle) style reuseIdentifier:(NSString*) reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
        self.accessoryView = _switchView;
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    return self;
}

@end