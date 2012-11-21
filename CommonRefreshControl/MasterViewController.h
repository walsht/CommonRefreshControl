//
//  MasterViewController.h
//  CommonRefreshControl
//
//  Created by Tim Walsh on 11/21/12.
//  Copyright (c) 2012 Walsh iTechnology LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

#import <CoreData/CoreData.h>

#import "CommonTableViewController.h"

@interface MasterViewController : CommonTableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
