//
// Created by Huang ChienShuo on 2/2/14.
// Copyright (c) 2014 ThousandSquare. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString* YoutubeApiFetchFailedNotification;
extern NSString* YoutubeApiFetchSuccessNotification;

@interface YoutubeApiFetcher : NSObject
- (id) initYoutubeApiFetcher;

- (void) fetchMostPopular;
@end