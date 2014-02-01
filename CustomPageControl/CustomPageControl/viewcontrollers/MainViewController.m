//
// Created by Huang ChienShuo on 2/1/14.
// Copyright (c) 2014 ThousandSuqare. All rights reserved.
//

#import "MainViewController.h"
#import "SMPageControl.h"
#import "UIColor+Util.h"
#import "UIImage+Util.h"
#import "Views.h"

CGFloat VIEWS_PAGE_CONTROL_HEIGHT = 5;
NSUInteger NUMBER_OF_PAGE = 10;

@interface MainViewController()
@property SMPageControl* pageControl;
@end

@implementation MainViewController

- (id) initMainViewController
{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
    }

    return self;
}

- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    UILabel* messageLabel = [[UILabel alloc] init];
    messageLabel.text = @"Rect page control, swipe for test.";
    messageLabel.font = [UIFont boldSystemFontOfSize:18];
    messageLabel.textColor = [UIColor hexARGB:0xFFFF6666];
    [messageLabel sizeToFit];

    [Views alignCenterMiddle:messageLabel containerFrame:self.view.bounds];
    [self.view addSubview:messageLabel];

    // Add swipe gesture
    UISwipeGestureRecognizer* swipeLeftGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                                     action:@selector(onSwipe:)];
    swipeLeftGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;

    UISwipeGestureRecognizer* swipeRightGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                                      action:@selector(onSwipe:)];
    swipeRightGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;

    [self.view addGestureRecognizer:swipeLeftGestureRecognizer];
    [self.view addGestureRecognizer:swipeRightGestureRecognizer];

    // calculate pageControl width, dot width
    CGFloat indicatorWith = 25;

    self.pageControl = [[SMPageControl alloc] init];
    [self.pageControl setBackgroundColor:[UIColor clearColor]];
    [self.pageControl setIndicatorMargin:2];

    [Views resize:self.pageControl
    containerSize:CGSizeMake(self.view.bounds.size.width - 60, VIEWS_PAGE_CONTROL_HEIGHT)];

    // set dot image
    UIImage* currentPageIndicatorImage = [UIImage imageWithRect:CGRectMake(0, 0, indicatorWith, VIEWS_PAGE_CONTROL_HEIGHT)
                                                          color:[UIColor hexARGB:0xFFFF6666]];

    UIImage* pageIndicatorImage = [UIImage imageWithRect:CGRectMake(0, 0, indicatorWith, VIEWS_PAGE_CONTROL_HEIGHT)
                                                   color:[UIColor hexARGB:0xFF333333]];

    [self.pageControl setCurrentPageIndicatorImage:currentPageIndicatorImage];
    [self.pageControl setPageIndicatorImage:pageIndicatorImage];

    self.pageControl.numberOfPages = NUMBER_OF_PAGE;
    self.pageControl.currentPage = 0;

    [Views locate:self.pageControl y:self.view.bounds.size.height - VIEWS_PAGE_CONTROL_HEIGHT - 10];
    [Views alignCenter:self.pageControl containerWidth:self.view.bounds.size.width];
    [self.view addSubview:self.pageControl];
}

- (void) onSwipe:(UISwipeGestureRecognizer*) recognizer
{
    if (UISwipeGestureRecognizerDirectionLeft == recognizer.direction)
    {
        self.pageControl.currentPage = self.pageControl.currentPage + 1 > NUMBER_OF_PAGE ? self.pageControl.currentPage : self.pageControl.currentPage + 1;
    }
    else if (UISwipeGestureRecognizerDirectionRight == recognizer.direction)
    {
        self.pageControl.currentPage = self.pageControl.currentPage - 1 < 0 ? self.pageControl.currentPage : self.pageControl.currentPage - 1;
    }
}

@end