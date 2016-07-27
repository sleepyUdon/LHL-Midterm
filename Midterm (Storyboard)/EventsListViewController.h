//
//  EventsListViewController.h
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "DummyDataManager.h"

@interface EventsListViewController : UIViewController
@property (nonatomic, strong) DummyDataManager *dummyDataManager;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSFetchedResultsController *fetchResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
