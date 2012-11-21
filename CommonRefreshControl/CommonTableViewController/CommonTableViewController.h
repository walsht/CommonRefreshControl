//
//  CommonTableViewController.h
//  CommonRefreshControl
//
//  Created by Tim Walsh on 11/21/12.
//  Copyright (c) 2012 Walsh iTechnology LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RefreshLogicBlock)(void);

@interface CommonTableViewController : UITableViewController

@property (nonatomic, copy) RefreshLogicBlock refreshLogicBlock;

-(void)setUpSync:(RefreshLogicBlock)refreshLogicBlock;
-(void)setUpRefresh:(RefreshLogicBlock)refreshLogicBlock;

-(void)setUpRefresh:(NSAttributedString*)title
       workingTitle:(NSAttributedString*)workingTitle
         retryTitle:(NSAttributedString*)retryTitle
  refreshLogicBlock:(RefreshLogicBlock)refreshLogicBlock;

-(void)refreshView:(UIRefreshControl *)refresh;
-(void)startRefresh;
-(void)endRefresh;
-(void)endRefreshWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

@end
