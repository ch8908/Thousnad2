//
// Created by Huang ChienShuo on 9/8/13.
// Copyright (c) 2013 ThousandSquare. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Views.h"

CGFloat const VIEWS_NAVIGATION_BAR_HEIGHT = 44;
CGFloat const VIEWS_STATUS_BAR_HEIGHT = 20;
CGFloat const VIEWS_PAGE_CONTROL_HEIGHT = 3;

@implementation Views

+ (BOOL) isRetina
{
    return ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2);
}

+ (BOOL) isRetina4
{
    if (![self isRetina])
    {
        return NO;
    }
    return [UIScreen mainScreen].bounds.size.height == 568.0f;
}

+ (CGFloat) screenWidth
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    return screenWidth;
}

+ (CGFloat) screenHeight
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    return screenHeight;
}

+ (CGFloat) viewHeight
{
    return [Views screenHeight] - VIEWS_STATUS_BAR_HEIGHT - VIEWS_NAVIGATION_BAR_HEIGHT;
}

+ (void) locate:(UIView*) target x:(CGFloat) x y:(CGFloat) y
{
    CGRect rect = target.frame;
    rect.origin.x = x;
    rect.origin.y = y;
    target.frame = rect;
}

+ (void) locate:(UIView*) target y:(CGFloat) y
{
    CGRect rect = target.frame;
    rect.origin.y = y;
    target.frame = rect;
}

+ (void) locate:(UIView*) target x:(CGFloat) x
{
    CGRect rect = target.frame;
    rect.origin.x = x;
    target.frame = rect;
}

+ (CGFloat) rightOf:(UIView*) view
{
    return view.frame.origin.x + view.frame.size.width;
}

+ (CGFloat) bottomOf:(UIView*) view
{
    return view.frame.origin.y + view.frame.size.height;
}

+ (void) alignCenter:(UIView*) target containerWidth:(CGFloat) containerWidth
{
    CGRect rect = target.frame;
    rect.origin.x = roundf((containerWidth - rect.size.width) / 2);
    target.frame = rect;
}

+ (void) alignCenterMiddle:(UIView*) target containerFrame:(CGRect) frameRect
{
    CGRect rect = target.frame;
    rect.origin.x = roundf(frameRect.origin.x + (frameRect.size.width - rect.size.width) / 2);
    rect.origin.y = roundf(frameRect.origin.y + (frameRect.size.height - rect.size.height) / 2);
    target.frame = rect;
}

+ (void) alignMiddle:(UIView*) target containerHeight:(CGFloat) containerHeight
{
    CGRect rect = target.frame;
    rect.origin.y = roundf((containerHeight - rect.size.height) / 2);
    target.frame = rect;
}

+ (void) alignBottom:(UIView*) source withTarget:(UIView*) target
{
    [self locate:source y:[self bottomOf:target] - source.bounds.size.height];
}

+ (void) alignTop:(UIView*) view withTarget:(UIView*) target
{
    [self locate:view y:target.frame.origin.y];
}

+ (void) below:(UIView*) view withTarget:(UIView*) target
{
    [self locate:view y:target.frame.origin.y + target.bounds.size.height];
}

+ (void) alignMiddle:(UIView*) source withTarget:(UIView*) target
{
    [self locate:source y:target.frame.origin.y + (target.bounds.size.height - source.bounds.size.height) * 0.5];
}

+ (void) resize:(UIView*) target containerSize:(CGSize) size
{
    CGRect rect = target.frame;
    rect.size = size;
    target.frame = rect;
}

+ (void) resize:(UIView*) target containerWidth:(CGFloat) containerWidth
{
    CGRect rect = target.frame;
    rect.size = CGSizeMake(containerWidth, rect.size.height);
    target.frame = rect;
}

+ (void) resize:(UIView*) target containerHeight:(CGFloat) containerHeight
{
    CGRect rect = target.frame;
    rect.size = CGSizeMake(rect.size.width, containerHeight);
    target.frame = rect;
}

+ (void) move:(UIView*) target deltaX:(CGFloat) dx deltaY:(CGFloat) dy
{
    CGRect rect = target.frame;
    rect.origin.x += dx;
    rect.origin.y += dy;
    target.frame = rect;
}

+ (void) alignCenter:(UIView*) source withTarget:(UIView*) target
{
    [Views locate:source y:target.frame.origin.y + target.bounds.size.height / 2 - source.bounds.size.height / 2];
}
@end