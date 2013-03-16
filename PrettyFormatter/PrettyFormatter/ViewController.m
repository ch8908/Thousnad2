//
// Created by Kros on 3/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ViewController.h"
#import "PrettyFormatter.h"


@implementation ViewController

- (id) initWithNibName:(NSString*) nibNameOrNil bundle:(NSBundle*) nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {

    }
    return self;
}

//For convenient, create label
- (UILabel*) createLabel
{
    UILabel* newLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 40)] autorelease];
    newLabel.font = [UIFont systemFontOfSize:16];
    newLabel.textColor = [UIColor blackColor];
    newLabel.backgroundColor = [UIColor clearColor];
    return newLabel;
}

//For convenient, change location
- (void) locate:(UIView*) target x:(CGFloat) x y:(CGFloat) y
{
    CGRect rect = target.frame;
    rect.origin.x = x;
    rect.origin.y = y;
    target.frame = rect;
}

- (void) viewDidLoad
{
    [super viewDidLoad];

    UILabel* labelTwitter = [self createLabel];
    labelTwitter.text = @"Twitter format:";
    labelTwitter.textColor = [UIColor greenColor];
    labelTwitter.font = [UIFont systemFontOfSize:20];
    [self locate:labelTwitter x:0 y:0];
    [self.view addSubview:labelTwitter];
    [labelTwitter sizeToFit];

    //Twitter time format demo
    UILabel* label1 = [self createLabel];
    label1.text = [PrettyFormatter twitterFormat:[NSDate dateWithTimeIntervalSinceNow:-10]];
    [label1 sizeToFit];
    [self locate:label1 x:0 y:labelTwitter.frame.origin.y + labelTwitter.bounds.size.height];
    [self.view addSubview:label1];

    UILabel* label2 = [self createLabel];
    label2.text = [PrettyFormatter twitterFormat:[NSDate dateWithTimeIntervalSinceNow:-60 * 10]];
    [label2 sizeToFit];
    [self locate:label2 x:0 y:label1.frame.origin.y + label1.bounds.size.height];
    [self.view addSubview:label2];

    UILabel* label3 = [self createLabel];
    label3.text = [PrettyFormatter twitterFormat:[NSDate dateWithTimeIntervalSinceNow:-60 * 60]];
    [label3 sizeToFit];
    [self locate:label3 x:0 y:label2.frame.origin.y + label2.bounds.size.height];
    [self.view addSubview:label3];

    UILabel* label4 = [self createLabel];
    label4.text = [PrettyFormatter twitterFormat:[NSDate dateWithTimeIntervalSinceNow:-3600 * 25]];
    [label4 sizeToFit];
    [self locate:label4 x:0 y:label3.frame.origin.y + label3.bounds.size.height];
    [self.view addSubview:label4];

    UILabel* label5 = [self createLabel];
    label5.text = [PrettyFormatter twitterFormat:[NSDate dateWithTimeIntervalSinceNow:-3600 * 24 * 366]];
    [label5 sizeToFit];
    [self locate:label5 x:0 y:label4.frame.origin.y + label4.bounds.size.height];
    [self.view addSubview:label5];

    //Facebook format demo
    UILabel* labelFacebook = [self createLabel];
    labelFacebook.text = @"Facebook format:";
    labelFacebook.textColor = [UIColor blueColor];
    labelFacebook.font = [UIFont systemFontOfSize:20];
    [self locate:labelFacebook x:150 y:0];
    [self.view addSubview:labelFacebook];
    [labelFacebook sizeToFit];


    UILabel* label6 = [self createLabel];
    label6.text = [PrettyFormatter facebookFormat:[NSDate dateWithTimeIntervalSinceNow:-2]];
    [label6 sizeToFit];
    [self locate:label6 x:labelFacebook.frame.origin.x
               y:labelFacebook.frame.origin.y + labelFacebook.bounds.size.height];
    [self.view addSubview:label6];

    UILabel* label7 = [self createLabel];
    label7.text = [PrettyFormatter facebookFormat:[NSDate dateWithTimeIntervalSinceNow:-10]];
    [label7 sizeToFit];
    [self locate:label7 x:label6.frame.origin.x y:label6.frame.origin.y + label6.bounds.size.height];
    [self.view addSubview:label7];

    UILabel* label8 = [self createLabel];
    label8.text = [PrettyFormatter facebookFormat:[NSDate dateWithTimeIntervalSinceNow:-60 * 4]];
    [label8 sizeToFit];
    [self locate:label8 x:label7.frame.origin.x y:label7.frame.origin.y + label7.bounds.size.height];
    [self.view addSubview:label8];

    UILabel* label9 = [self createLabel];
    label9.text = [PrettyFormatter facebookFormat:[NSDate dateWithTimeIntervalSinceNow:-3600 * 25]];
    [label9 sizeToFit];
    [self locate:label9 x:label8.frame.origin.x y:label8.frame.origin.y + label8.bounds.size.height];
    [self.view addSubview:label9];

    UILabel* label10 = [self createLabel];
    label10.text = [PrettyFormatter facebookFormat:[NSDate dateWithTimeIntervalSinceNow:-3600 * 24 * 3]];
    [label10 sizeToFit];
    [self locate:label10 x:label9.frame.origin.x y:label9.frame.origin.y + label9.bounds.size.height];
    [self.view addSubview:label10];

    UILabel* label11 = [self createLabel];
    label11.text = [PrettyFormatter facebookFormat:[NSDate dateWithTimeIntervalSinceNow:-3600 * 24 * 9]];
    [label11 sizeToFit];
    [self locate:label11 x:label10.frame.origin.x y:label10.frame.origin.y + label10.bounds.size.height];
    [self.view addSubview:label11];

    UILabel* label12 = [self createLabel];
    label12.text = [PrettyFormatter facebookFormat:[NSDate dateWithTimeIntervalSinceNow:-3600 * 24 * 365 * 3]];
    [label12 sizeToFit];
    [self locate:label12 x:label11.frame.origin.x y:label11.frame.origin.y + label11.bounds.size.height];
    [self.view addSubview:label12];
}

@end