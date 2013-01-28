//
// Created by Kros on 1/1/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AbstractPasscodeLockViewController.h"
#import "PasscodeKeyboard.h"

static CGFloat CANVAS_WIDTH = 300;
static CGFloat CANVAS_HEIGHT = 100;

@interface AbstractPasscodeLockViewController()<PasscodeKeyboardDelegate>
@property (nonatomic, readwrite, copy) NSMutableArray* inputTextFieldImages;
@property (nonatomic, readwrite, assign) BOOL processing;
@property (nonatomic, readwrite, copy) NSMutableString* inputPasscodeString;
@end

@implementation AbstractPasscodeLockViewController
@synthesize inputTextFieldImages = _inputTextFieldImages;
@synthesize processing = _processing;
@synthesize inputPasscodeString = _inputPasscodeString;
@synthesize noticeLabel = _noticeLabel;


- (void) dealloc
{
    [_inputTextFieldImages release];
    [_inputPasscodeString release];
    [_noticeLabel release];
    [super dealloc];
}

- (id) initPasscodeLock
{
    self = [super init];
    if (self)
    {
        _inputPasscodeString = [[NSMutableString alloc] init];
        _inputTextFieldImages = [[NSMutableArray alloc] init];
        _noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    }
    return self;
}

- (id) init
{
    return [self initPasscodeLock];
}

- (void) viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];

    CGFloat viewHeight = self.view.bounds.size.height;
    if (self.navigationController)
    {
        viewHeight -= self.navigationController.navigationBar.bounds.size.height;
    }

    PasscodeKeyboard* keyboard = [[[PasscodeKeyboard alloc] init] autorelease];
    keyboard.delegate = self;
    [keyboard setFrame:CGRectMake(keyboard.frame.origin.x,
                                  viewHeight - keyboard.bounds.size.height,
                                  keyboard.bounds.size.width,
                                  keyboard.bounds.size.height)];
    [self.view addSubview:keyboard];

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UIView* canvas = [[[UIView alloc] initWithFrame:CGRectMake((screenRect.size.width - CANVAS_WIDTH) * 0.5,
                                                               ((viewHeight - keyboard.bounds.size.height) - CANVAS_HEIGHT) * 0.2,
                                                               CANVAS_WIDTH,
                                                               CANVAS_HEIGHT)] autorelease];
    canvas.backgroundColor = [UIColor clearColor];
    [self.view addSubview:canvas];

    UILabel* titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)] autorelease];
    [titleLabel setFrame:CGRectMake((CANVAS_WIDTH - titleLabel.bounds.size.width) / 2,
                                    canvas.frame.origin.y + 10,
                                    titleLabel.bounds.size.width,
                                    titleLabel.bounds.size.height)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"Please enter passcode";


    [self.view addSubview:titleLabel];

    self.noticeLabel.text = @"Please enter passcode";
    [self.noticeLabel setFrame:CGRectMake((CANVAS_WIDTH - self.noticeLabel.bounds.size.width) / 2,
                                          titleLabel.frame.origin.y + titleLabel.frame.size.height + 5,
                                          self.noticeLabel.bounds.size.width, self.noticeLabel.bounds.size.height)];
    self.noticeLabel.textAlignment = NSTextAlignmentCenter;
    self.noticeLabel.backgroundColor = [UIColor clearColor];

    [self.view addSubview:self.noticeLabel];

    for (NSUInteger i = 0; i < 4; i++)
    {
        UIImageView* imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image/password_digit.png"]] autorelease];
        [self.inputTextFieldImages addObject:imageView];
        [imageView setFrame:CGRectMake(20 + 14 * i + 59 * i,
                                       canvas.frame.origin.y + canvas.frame.size.height,
                                       imageView.bounds.size.width,
                                       imageView.bounds.size.height)];
        [self.view addSubview:imageView];
    }

}

- (void) updateNotice:(NSString*) notice
{
    self.noticeLabel.text = notice;
}

- (void) clearPasscode
{
    [self.inputPasscodeString setString:@""];
    [self updateDigits];
}

- (void) updateDigits
{
    int inputLength = self.inputPasscodeString.length;
    for (NSUInteger i = 0; i < self.inputTextFieldImages.count; i++)
    {
        UIImageView* imageView = self.inputTextFieldImages[i];
        if (i < inputLength)
        {
            imageView.image = [UIImage imageNamed:@"image/password_digit_filled.png"];
        }
        else
        {
            imageView.image = [UIImage imageNamed:@"image/password_digit.png"];
        }
    }
}

- (void) clearAndUpdateNotice:(NSString*) notice
{
    [self clearPasscode];
    [self updateNotice:notice];
}

- (void) onNumberClicked:(NSString*) number
{
    if (self.inputPasscodeString.length >= 4 || self.processing)
    {
        return;
    }

    [self.inputPasscodeString appendString:number];
    [self updateDigits];

    if (self.inputPasscodeString.length >= 4 && !self.processing)
    {
        self.processing = YES;
        [self onFilled:self.inputPasscodeString];
        self.processing = NO;
    }
}

- (void) onBackspaceClicked
{
    if (self.inputPasscodeString.length <= 0 || self.processing)
    {
        return;
    }
    [self.inputPasscodeString deleteCharactersInRange:NSMakeRange(self.inputPasscodeString.length - 1, 1)];
    [self updateDigits];
}

- (void) onFilled:(NSString*) result
{
    [self doesNotRecognizeSelector:_cmd];
}

@end