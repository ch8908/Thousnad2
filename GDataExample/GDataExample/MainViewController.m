//
// Created by Huang ChienShuo on 2/2/14.
// Copyright (c) 2014 ThousandSquare. All rights reserved.
//

#import "MainViewController.h"
#import "YoutubeApiFetcher.h"
#import "MyYoutubeModel.h"
#import "UIImageView+AFNetworking.h"


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
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;

        _youtubeVideos = [NSMutableArray array];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onYoutubeApiFetchFailedNotification:)
                                                     name:YoutubeApiFetchFailedNotification object:nil];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onYoutubeApiFetchSuccessNotification:)
                                                     name:YoutubeApiFetchSuccessNotification object:nil];

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

    self.tableView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:self.tableView];
}

- (void) onYoutubeApiFetchFailedNotification:(NSNotification*) notification
{

}

- (void) onYoutubeApiFetchSuccessNotification:(NSNotification*) notification
{
    self.youtubeVideos = notification.object;
    [self.tableView reloadData];
}

- (NSInteger) tableView:(UITableView*) tableView numberOfRowsInSection:(NSInteger) section
{
    return self.youtubeVideos.count;
}

- (CGFloat) tableView:(UITableView*) tableView heightForRowAtIndexPath:(NSIndexPath*) indexPath
{
    return 80;
}

- (UITableViewCell*) tableView:(UITableView*) tableView cellForRowAtIndexPath:(NSIndexPath*) indexPath
{
    static NSString* CellIdentifier = @"SettingCell";

    UITableViewCell* cell = (UITableViewCell*)
      [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    MyYoutubeModel* model = self.youtubeVideos[(NSUInteger) indexPath.row];
    cell.textLabel.text = model.title;
    NSURL* url = [NSURL URLWithString:model.thumbnailUrl relativeToURL:nil];
    __weak UITableViewCell* preventCircularRef = cell;
    [cell.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:url]
                          placeholderImage:nil
                                   success:^(NSURLRequest* request, NSHTTPURLResponse* response, UIImage* image) {
                                       [preventCircularRef.imageView setImage:image];
                                       [preventCircularRef setNeedsLayout];
                                   }
                                   failure:^(NSURLRequest* request, NSHTTPURLResponse* response, NSError* error) {

                                   }];
    return cell;
}

- (void) tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath*) indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end