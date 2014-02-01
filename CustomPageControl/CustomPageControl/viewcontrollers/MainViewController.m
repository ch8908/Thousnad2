//
// Created by Huang ChienShuo on 2/1/14.
// Copyright (c) 2014 ThousandSuqare. All rights reserved.
//

#import "MainViewController.h"
#import "SMPageControl.h"
#import "UIColor+Util.h"
#import "UIImage+Util.h"
#import "Views.h"

CGFloat VIEWS_PAGE_CONTROL_HEIGHT = 3;
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

    // make pageControl
    UIView* bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 80)];
    bgView.backgroundColor = [UIColor lightGrayColor];
    UISwipeGestureRecognizer* swipeLeftGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                                     action:@selector(onSwipe:)];

    swipeLeftGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;

    UISwipeGestureRecognizer* swipeRightGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                                      action:@selector(onSwipe:)];

    swipeRightGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;

    [bgView addGestureRecognizer:swipeLeftGestureRecognizer];
    [bgView addGestureRecognizer:swipeRightGestureRecognizer];

    CGFloat indicatorWith = self.view.bounds.size.width / NUMBER_OF_PAGE;

    self.pageControl = [[SMPageControl alloc] init];
    [self.pageControl setBackgroundColor:[UIColor clearColor]];
    [self.pageControl setIndicatorMargin:0];

    [Views resize:self.pageControl containerSize:CGSizeMake(self.view.bounds.size.width, VIEWS_PAGE_CONTROL_HEIGHT)];

    UIImage* currentPageIndicatorImage = [UIImage imageWithRect:CGRectMake(0, 0, indicatorWith, VIEWS_PAGE_CONTROL_HEIGHT)
                                                          color:[UIColor hexARGB:0xFFFF6666]];

    UIImage* pageIndicatorImage = [UIImage imageWithRect:CGRectMake(0, 0, indicatorWith, VIEWS_PAGE_CONTROL_HEIGHT)
                                                   color:[UIColor hexARGB:0x19FFCFCF]];

    [self.pageControl setCurrentPageIndicatorImage:currentPageIndicatorImage];
    [self.pageControl setPageIndicatorImage:pageIndicatorImage];

    self.pageControl.numberOfPages = NUMBER_OF_PAGE;
    self.pageControl.currentPage = 0;

    [Views alignCenterMiddle:self.pageControl containerFrame:bgView.bounds];

    [bgView addSubview:self.pageControl];
    [self.view addSubview:bgView];
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