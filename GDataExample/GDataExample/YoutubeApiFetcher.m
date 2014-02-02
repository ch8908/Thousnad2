//
// Created by Huang ChienShuo on 2/2/14.
// Copyright (c) 2014 ThousandSquare. All rights reserved.
//

#import "YoutubeApiFetcher.h"
#import "GDataServiceGoogleYouTube.h"
#import "GDataEntryYouTubeVideo.h"

NSString* YoutubeApiFetchFailedNotification = @"YoutubeApiFetchFailedNotification";
NSString* YoutubeApiFetchSuccessNotification = @"YoutubeApiFetchSuccessNotification";

static NSString* YOUTUBE_API_V2_KEY = @"AI39si5pHjNCtg0zibyhR6rlKKrUHuiTdNlDwG_zAK1zwqnZujOxLDtEN_JR9KEu4KTP_aOmfHkBp2zvSY1aaL6KKcqf8vl6LQ";

@implementation YoutubeApiFetcher

- (id) initYoutubeApiFetcher
{
    self = [super init];
    if (self)
    {

    }

    return self;
}

- (void) fetchMostPopular
{
    GDataServiceGoogleYouTube* service = [[GDataServiceGoogleYouTube alloc] init];
    [service setYouTubeDeveloperKey:YOUTUBE_API_V2_KEY];

    // Get "most popular" feed url
    NSURL* feedURL = [GDataServiceGoogleYouTube youTubeURLForFeedID:kGDataYouTubeFeedIDMostPopular];

    [service fetchFeedWithURL:feedURL
            completionHandler:^(GDataServiceTicket* ticket, GDataFeedBase* feed, NSError* error) {
                if (ticket.statusCode / 100 != 2)
                {
                    NSLog(@">>>>>> failed:%@", error);
                    [[NSNotificationCenter defaultCenter] postNotificationName:YoutubeApiFetchFailedNotification
                                                                        object:nil];
                    return;
                }

                NSLog(@">>>>>> feed:%@", feed);
                for (GDataEntryYouTubeVideo* entry in [feed entries])
                {
                    NSLog(@">>>>> enrty:%@", entry);
                }
            }];
}

@end