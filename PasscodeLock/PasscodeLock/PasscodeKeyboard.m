//
// Created by Kros on 1/1/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PasscodeKeyboard.h"

CGFloat const VIEWS_PORTRAIT_WIDTH = 320;
CGFloat const KEYBOARD_HEIGHT = 216;

@interface PasscodeKeyboard()
@property (nonatomic, readwrite, copy) NSMutableArray* allKeys;
@end

@implementation PasscodeKeyboard
@synthesize allKeys = _allKeys;

- (void) dealloc
{
    [_allKeys release];
    [super dealloc];
}

- (id) initKeyboard
{
    self = [super initWithFrame:CGRectMake(0, 0, VIEWS_PORTRAIT_WIDTH, KEYBOARD_HEIGHT)];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        _allKeys = [[NSMutableArray alloc] init];
        NSArray* keyboardContent = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @" ", @"0", @"BAK"];
        for (NSUInteger i = 0; i < keyboardContent.count; i++)
        {
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];

            //UI Setting
            if ([keyboardContent[i] isEqualToString:@" "] || [keyboardContent[i] isEqualToString:@"BAK"])
            {
                [button setBackgroundImage:[UIImage imageNamed:@"image/keyboard_key_pressed.png"]
                                  forState:UIControlStateNormal];
                [button setBackgroundImage:[UIImage imageNamed:@"image/keyboard_key_normal.png"]
                                  forState:UIControlStateHighlighted];
            }
            else
            {
                [button setBackgroundImage:[UIImage imageNamed:@"image/keyboard_key_normal.png"]
                                  forState:UIControlStateNormal];
                [button setBackgroundImage:[UIImage imageNamed:@"image/keyboard_key_pressed.png"]
                                  forState:UIControlStateHighlighted];
            }
            button.frame = CGRectMake(0, 0, 107, 54);
            [button setTitle:keyboardContent[i] forState:UIControlStateNormal];
            [button setFrame:CGRectMake(i % 3 * 107,
                                        i / 3 * 54,
                                        button.bounds.size.width,
                                        button.bounds.size.height)];

            //We need to handle touch event ourself
            button.userInteractionEnabled = NO;
            [_allKeys addObject:button];

            [self addSubview:button];
        }
    }
    return self;
}

- (id) init
{
    return [self initKeyboard];
}

- (void) highlightSelectedButtonWithEvent:(UIEvent*) event
{
    for (UITouch* touch in [[event touchesForView:self] allObjects])
    {
        CGPoint location = [touch locationInView:self];
        for (UIButton* button in self.allKeys)
        {
            button.highlighted = CGRectContainsPoint(button.frame, location);
        }
    }
}

- (void) onClick:(UIButton*) sender
{
    NSString* input = sender.titleLabel.text;
    if ([input isEqualToString:@" "])
    {
        return;
    }
    else if ([input isEqualToString:@"BAK"])
    {
        [self.delegate onBackspaceClicked];
    }
    else
    {
        [self.delegate onNumberClicked:input];
    }
}

- (void) touchesBegan:(NSSet*) touches withEvent:(UIEvent*) event
{
    [super touchesBegan:touches withEvent:event];
    [self highlightSelectedButtonWithEvent:event];
}

- (void) touchesMoved:(NSSet*) touches withEvent:(UIEvent*) event
{
    [super touchesMoved:touches withEvent:event];
    [self highlightSelectedButtonWithEvent:event];
}

- (void) touchesEnded:(NSSet*) touches withEvent:(UIEvent*) event
{
    [super touchesEnded:touches withEvent:event];
    for (UITouch* touch in [[event touchesForView:self] allObjects])
    {
        CGPoint location = [touch locationInView:self];
        for (UIButton* button in self.allKeys)
        {
            button.highlighted = NO;
            if (CGRectContainsPoint(button.frame, location))
            {
                [self onClick:button];
            }
        }
    }
}

- (void) touchesCancelled:(NSSet*) touches withEvent:(UIEvent*) event
{
    [super touchesCancelled:touches withEvent:event];
    for (UITouch* touch in [[event touchesForView:self] allObjects])
    {
        for (UIButton* button in self.allKeys)
        {
            button.highlighted = NO;
        }
    }
}

@end