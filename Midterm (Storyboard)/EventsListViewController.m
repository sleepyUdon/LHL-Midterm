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
    
    Dog *dogPath = event.mainDog;
    
    cell.petImage.image = [UIImage imageWithData:dogPath.dogPicture];
    cell.eventTitle.text = event.eventTitle;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm"];
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


@end