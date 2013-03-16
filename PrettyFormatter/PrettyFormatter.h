//
// Created by Kros on 3/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface PrettyFormatter : NSObject
+ (NSString*) twitterFormat:(NSDate*) date;
+ (NSString*) facebookFormat:(NSDate*) date;
@end