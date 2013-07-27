//
// Created by Kros on 3/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PrettyFormatter.h"


@implementation PrettyFormatter

+ (NSString*) twitterFormat:(NSDate*) date
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit |
      NSMonthCalendarUnit |
      NSDayCalendarUnit |
      NSHourCalendarUnit |
      NSMinuteCalendarUnit |
      NSSecondCalendarUnit
                                               fromDate:date toDate:[NSDate date] options:0];

    if (components.year > 0)
    {
        return [NSString stringWithFormat:@"%iy", components.year];
    }
    else if (components.day > 0)
    {
        NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat:@"d MMM"];
        return [formatter stringFromDate:date];
    }
    else if (components.hour > 0)
    {
        return [NSString stringWithFormat:@"%ih", components.hour];
    }
    else if (components.minute > 0)
    {
        return [NSString stringWithFormat:@"%im", components.minute];
    }
    else
    {
        return [NSString stringWithFormat:@"%is", components.second];
    }
}

+ (NSString*) facebookFormat:(NSDate*) date
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit |
      NSMonthCalendarUnit |
      NSDayCalendarUnit |
      NSHourCalendarUnit |
      NSMinuteCalendarUnit |
      NSSecondCalendarUnit
                                               fromDate:date toDate:[NSDate date] options:0];

    if (components.year > 0)
    {
        return [NSString stringWithFormat:@"%i %@ ago", components.year, components.year > 1 ? @"years" : @"year"];
    }
    else if (components.day > 0)
    {
        NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];

        if (components.day < 2)
        {
            return @"Yesterday";
        }

        if (components.day < 7)
        {
            [formatter setDateFormat:@"EEEE 'at' HH:mm"];
            return [formatter stringFromDate:date];
        }

        [formatter setDateFormat:@"MMM d 'at' hh:mm a"];
        return [formatter stringFromDate:date];
    }
    else if (components.hour > 0)
    {
        return [NSString stringWithFormat:@"%i %@ ago", components.hour, components.hour > 1 ? @"hours" : @"hour"];
    }
    else if (components.minute > 0)
    {
        return [NSString stringWithFormat:@"%i %@ ago", components.minute,
                                          components.minute > 1 ? @"minutes" : @"minute"];
    }
    else
    {
        if (components.second < 3)
        {
            return [NSString stringWithFormat:@"Just now"];
        }
        return [NSString stringWithFormat:@"%i %@ ago", components.second,
                                          components.second > 1 ? @"seconds" : @"second"];
    }
}

@end