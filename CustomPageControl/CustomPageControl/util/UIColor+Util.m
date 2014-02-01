//
// Created by liq on 12/19/13.
// Copyright (c) 2013 Liq. All rights reserved.
//

#import "UIColor+Util.h"


@implementation UIColor(Util)
+ (UIColor*) hexColor:(int) rgbHex
{
    int r = (rgbHex & 0xFF0000) >> 16;
    int g = (rgbHex & 0x00FF00) >> 8;
    int b = (rgbHex & 0x0000FF);

    return [UIColor colorWithRed:r / (float) 0xFF
                           green:g / (float) 0xFF
                            blue:b / (float) 0xFF
                           alpha:1];
}

+ (UIColor*) hexARGB:(int) argbHex
{
    int a = (argbHex & 0xFF000000) >> 24;
    int r = (argbHex & 0x00FF0000) >> 16;
    int g = (argbHex & 0x0000FF00) >> 8;
    int b = (argbHex & 0x000000FF);

    return [UIColor colorWithRed:r / (float) 0xFF
                           green:g / (float) 0xFF
                            blue:b / (float) 0xFF
                           alpha:a / (float) 0xFF];
}

@end