//
// Created by Huang ChienShuo on 12/22/13.
// Copyright (c) 2013 Liq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage(Util)
+ (UIImage*) imageWithColor:(UIColor*) color;

+ (UIImage*) imageWithRect:(CGRect) rect color:(UIColor*) color;

- (UIImage*) cropImageWithRect:(CGRect) rect;

- (UIImage*) resizeImageWithSize:(CGSize) newSize;
@end