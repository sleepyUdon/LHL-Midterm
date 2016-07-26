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

@interface EventsListViewController ()

@property (nonatomic, strong) NSArray *eventsArray;

@end

@implementation EventsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    DummyDataManager *dataManager = [[DummyDataManager alloc]initWithManagedObjectContext:context];
    self.eventsArray = dataManager.fetchAllEvents;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateData];
}

- (void)updateData {
    //[self fetchingData];
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
    //image should be from CoreData Dog Entity
    //but first you need to check if this dog under user who is logged in
    //create separate private method for checking if the user is logged in in AppDelegate or
    //in User class
    //if the user is logged in then grab the image and name of the dog under this user
    //and assigned it to the event's imageView and nameLabel
    //import User.h file
    //User *user = [[User alloc]init];
    //if ([user isLoggedIn]) {
    ////here is the Code for Creating an instance of Dog(do not forget to import Dog.h
    ////Dog *dog = [[Dog alloc]init];
    ////cell.petImageView.image = dog.image;
    //}
    Dog *dogPath = event.mainDog;
    
    cell.petImage.image = [ UIImage imageWithData:dogPath.dogPicture ];
    cell.eventTitle.text = event.eventTitle;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDate = [dateFormatter stringFromDate:event.eventDate];
    
    NSLog(@"%@",event.eventDate);
    
    cell.eventDate.text = formattedDate;
    cell.eventAddress.text = event.eventAddress;
    
    return cell;
}


//- (void)fetchingData {
//    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Event"];
//    
//    //sort an array
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"eventDate" ascending:YES];
//    [request setSortDescriptors:@[sortDescriptor]];
//    self.eventsArray = [context executeFetchRequest:request error:nil];
//    NSLog(@"%@",self.eventsArray);
//}



@end
