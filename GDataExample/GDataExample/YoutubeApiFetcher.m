//
// Created by Huang ChienShuo on 2/2/14.
// Copyright (c) 2014 ThousandSquare. All rights reserved.
//

#import "YoutubeApiFetcher.h"
#import "GDataServiceGoogleYouTube.h"
#import "GDataEntryYouTubeVideo.h"
#import "MyYoutubeModel.h"
#import "GDataFeedYouTubeVideo.h"
#import "GDataQueryYouTube.h"

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
    // Create Youtube service
    GDataServiceGoogleYouTube* service = [[GDataServiceGoogleYouTube alloc] init];
    [service setYouTubeDeveloperKey:YOUTUBE_API_V2_KEY];

    // Get "most popular" feed url
    NSURL* feedURL = [GDataServiceGoogleYouTube youTubeURLForFeedID:kGDataYouTubeFeedIDMostPopular];

    // Start fetch
    [service fetchFeedWithURL:feedURL
            completionHandler:^(GDataServiceTicket* ticket, GDataFeedBase* feed, NSError* error) {
                if (ticket.statusCode / 100 != 2)
                {
                    [[NSNotificationCenter defaultCenter] postNotificationName:YoutubeApiFetchFailedNotification
                                                                        object:nil];
                    return;
                }

                NSMutableArray* youtubeVideos = [NSMutableArray array];

                // Convert to our model
                for (GDataEntryYouTubeVideo* entry in [feed entries])
                {
                    MyYoutubeModel* youtubeModel = [[MyYoutubeModel alloc] init];
                    youtubeModel.videoId = entry.mediaGroup.videoID;
                    NSLog(@">>>>> youtubeModel.identifier:%@", youtubeModel.videoId);


                    youtubeModel.title = entry.title.stringValue;
                    youtubeModel.viewCount = entry.statistics.viewCount;
                    GDataMediaThumbnail* thumbnail = entry.mediaGroup.mediaThumbnails[0];
                    youtubeModel.thumbnailUrl = thumbnail.URLString;
                    [youtubeVideos addObject:youtubeModel];
                }

                // Post to view controller
                [[NSNotificationCenter defaultCenter] postNotificationName:YoutubeApiFetchSuccessNotification
                                                                    object:[youtubeVideos copy]];
            }];
}

- (void) batchRequestWithVideos:(NSMutableArray*) videos
{
    // Create Youtube service
    GDataServiceGoogleYouTube* service = [[GDataServiceGoogleYouTube alloc] init];
    [service setYouTubeDeveloperKey:YOUTUBE_API_V2_KEY];

    // Get "most popular" feed url
    NSURL* feedURL = [GDataServiceGoogleYouTube youTubeURLForFeedID:kGDataYouTubeFeedIDFull];

    [service fetchFeedWithURL:feedURL
            completionHandler:^(GDataServiceTicket* ticket, GDataFeedBase* feed, NSError* error) {

                if (ticket.statusCode / 100 != 2)
                {
                    [[NSNotificationCenter defaultCenter] postNotificationName:YoutubeApiFetchFailedNotification
                                                                        object:nil];
                    return;
                }

                NSURL* batchURL = [[feed batchLink] URL];

                GDataFeedYouTubeVideo* feedYouTubeVideo = [GDataFeedYouTubeVideo videoFeed];

                for (MyYoutubeModel* video in videos)
                {
                    GDataYouTubeVideoID* videoID = [[GDataYouTubeVideoID alloc] init];

                    GDataEntryYouTubeVideo* youTubeVideoEntry = [GDataEntryYouTubeVideo videoEntry];
                    youTubeVideoEntry.identifier = [NSString stringWithFormat:@"%@%@",
                                                                              @"http://gdata.youtube.com/feeds/api/videos/",
                                                                              video.videoId];

                    [feedYouTubeVideo addEntry:youTubeVideoEntry];
                }

                GDataBatchOperation* op;
                op = [GDataBatchOperation batchOperationWithType:kGDataBatchOperationQuery];
                [feedYouTubeVideo setBatchOperation:op];

                [self fetchBatchWithService:service feed:feedYouTubeVideo
                                   batchURL:batchURL];

            }];
}

- (void) fetchBatchWithService:(GDataServiceGoogleYouTube*) service feed:(GDataFeedYouTubeVideo*) youtubeVideoFeed batchURL:(NSURL*) batchURL
{
    [service fetchFeedWithBatchFeed:youtubeVideoFeed forBatchFeedURL:batchURL
                  completionHandler:^(GDataServiceTicket* ticket, GDataFeedBase* feed, NSError* error) {
                      if (ticket.statusCode / 100 != 2)
                      {
                          [[NSNotificationCenter defaultCenter] postNotificationName:YoutubeApiFetchFailedNotification
                                                                              object:nil];
                          return;
                      }

                      NSMutableArray* youtubeEntries = [[NSMutableArray alloc] init];
                      for (GDataEntryYouTubeVideo* entry in [feed entries])
                      {
                          NSLog(@">>>>> batch entry:%@", entry);
                      }

                  }];
}

@end