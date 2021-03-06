//
//  MyMeetupsViewController.m
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-27.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "MyMeetupsViewController.h"
#import "MyMeetupsTableViewCell.h"
#import "AppDelegate.h"
#import "DummyDataManager.h"
#import "Dog.h"
#import "User.h"
#import "Event.h"
#import "EventDetailViewController.h"


@interface MyMeetupsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *eventsArray;


@end

@implementation MyMeetupsViewController

- (void)viewDidLoad {
    // get dummydata
    
    DummyDataManager *dataManager = ((AppDelegate *)[UIApplication sharedApplication].delegate).dummyDataManager;
    self.eventsArray = dataManager.fetchAllEvents;
    
    

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView DataSource
- (void)updateData {
    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.eventsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"userProfileCell";
    MyMeetupsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Event *event = self.eventsArray[indexPath.row];
    
    cell.eventTitle.text = event.eventTitle;
    cell.eventAddress.text = event.eventAddress;
    
    
    //
    if (!event.eventImage) {
        cell.eventImage.image = [UIImage imageNamed:@"dogPack4"];
    }
    else {
        cell.eventImage.image = [UIImage imageNamed:event.eventImage];
    }
//
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDate = [dateFormatter stringFromDate:event.eventDate];
    
    NSLog(@"%@",event.eventDate);
    
    cell.dateAndTime.text = formattedDate;
    
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
