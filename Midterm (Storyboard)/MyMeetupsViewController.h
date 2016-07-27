//
//  MyMeetupsViewController.h
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-27.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "DummyDataManager.h"

@interface MyMeetupsViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) DummyDataManager *dummyDataManager;

@end
