//
//  EventsListViewController.m
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "EventsListViewController.h"
#import "AppDelegate.h"
#import "Event.h"
#import "Dog.h"
#import "ListOfEventsTableViewCell.h"
#import "DummyDataManager.h"
#import "EventDetailViewController.h"

@interface EventsListViewController ()

@property (nonatomic, strong) NSArray *eventsArray;

@end

@implementation EventsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   DummyDataManager *dataManager = ((AppDelegate *)[UIApplication sharedApplication].delegate).dummyDataManager;
    self.eventsArray = dataManager.fetchAllEvents;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateData];
}

- (void)updateData {
    self.eventsArray = [EventsListViewController fetchingData];
    [self.tableView reloadData];
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.eventsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"eventCell";
    ListOfEventsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Event *event = self.eventsArray[indexPath.row];
    
    if (!event.eventImage) {
        cell.petImage.image = [UIImage imageNamed:@"dogPack4"];
    }
    else {
        cell.petImage.image = [UIImage imageNamed:event.eventImage];
    }

    cell.eventTitle.text = event.eventTitle;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MMM d, yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:event.eventDate];
    
    //NSLog(@"%@",event.eventDate);
    
    cell.eventDate.text = formattedDate;
    cell.eventAddress.text = event.eventAddress;
    
    return cell;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        
        EventDetailViewController *eventDVC = [segue destinationViewController];
        
        NSIndexPath *path = self.tableView.indexPathForSelectedRow;
        
        eventDVC.event = self.eventsArray[path.row];
        
    }
}

+ (NSArray *)fetchingData {
    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Event"];
    
    //sort an array
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"eventDate" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    return [context executeFetchRequest:request error:nil];
}


@end