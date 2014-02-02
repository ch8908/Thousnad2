//
// Created by Huang ChienShuo on 2/2/14.
// Copyright (c) 2014 ThousandSquare. All rights reserved.
//

#import "MainViewController.h"
#import "YoutubeApiFetcher.h"


@interface MainViewController()<UITableViewDataSource, UITableViewDelegate>
@property UITableView* tableView;
@property NSMutableArray* youtubeVideos;
@end

@implementation MainViewController

- (id) initMainViewController
{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;

        _youtubeVideos = [NSMutableArray array];
    }

    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    YoutubeApiFetcher* fetcher = [[YoutubeApiFetcher alloc] initYoutubeApiFetcher];
    [fetcher fetchMostPopular];
}

- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.view addSubview:self.tableView];
}

- (NSInteger) tableView:(UITableView*) tableView numberOfRowsInSection:(NSInteger) section
{
    return self.youtubeVideos.count;
}

- (UITableViewCell*) tableView:(UITableView*) tableView cellForRowAtIndexPath:(NSIndexPath*) indexPath
{
    return nil;
}

@end