//
//  CommonTableViewController.m
//  CommonRefreshControl
//
//  Created by Tim Walsh on 11/21/12.
//  Copyright (c) 2012 Walsh iTechnology LLC. All rights reserved.
//

#import "CommonTableViewController.h"

@interface CommonTableViewController ()

@property (nonatomic, strong) NSAttributedString* refreshTitle;
@property (nonatomic, strong) NSAttributedString* refreshWorkingTitle;
@property (nonatomic, strong) NSAttributedString* refreshRetryTitle;

@end

@implementation CommonTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Refresh Logic
-(void)setUpSync:(RefreshLogicBlock)refreshLogicBlock{
    [self setUpRefresh:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Sync", @"Sync refresh default title")]
          workingTitle:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Syncing...", @"Sync refresh processing default title")]
            retryTitle:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Re-Sync", @"Re-Sync refresh default title")]
     refreshLogicBlock:refreshLogicBlock];
}

-(void)setUpRefresh:(RefreshLogicBlock)refreshLogicBlock{
    [self setUpRefresh:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Refresh", @"Refresh default title")]
          workingTitle:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Working...", @"Refresh default processing title")]
            retryTitle:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Refresh", @"Refresh default title")]
     refreshLogicBlock:refreshLogicBlock];
}

-(void)setUpRefresh:(NSAttributedString*)title
       workingTitle:(NSAttributedString*)workingTitle
         retryTitle:(NSAttributedString*)retryTitle
  refreshLogicBlock:(RefreshLogicBlock)refreshLogicBlock{
    
    [self setRefreshTitle:title];
    [self setRefreshWorkingTitle:workingTitle];
    [self setRefreshRetryTitle:retryTitle];
    [self setRefreshLogicBlock:refreshLogicBlock];
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = _refreshTitle;
    [refresh addTarget:self
                action:@selector(refreshView:)
      forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:refresh];
}
-(void)refreshView:(UIRefreshControl *)refresh {
    [self startRefresh];
}
-(void)startRefresh{
    [[self refreshControl] setAttributedTitle:_refreshWorkingTitle];
    if (_refreshLogicBlock) {
        _refreshLogicBlock();
    }
}
-(void)endRefresh{
    [[self refreshControl] setAttributedTitle:_refreshRetryTitle];
    [[self refreshControl] endRefreshing];
}

-(void)endRefreshWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:dateStyle];
    [formatter setTimeStyle:timeStyle];
    NSString *lastUpdated = [NSString stringWithFormat:NSLocalizedString(@"Last updated on %@",@"Refresh last refreshed detail text"), [formatter stringFromDate:[NSDate date]]];
    [[self refreshControl] setAttributedTitle:[[NSAttributedString alloc] initWithString:lastUpdated]];
    [[self refreshControl] endRefreshing];
}

@end
