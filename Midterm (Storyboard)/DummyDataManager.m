//
//  DummyDataManager.m
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "DummyDataManager.h"
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Event.h"

@interface DummyDataManager()
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic,strong)  NSEntityDescription *dogEntityDescription;
@property (nonatomic, strong) NSArray *eventsArray;

@end

@implementation DummyDataManager

-(instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context {
    if (self = [super init]) {
        _context = context;
        [self createDataIfNeeded];
    }
    return self;
}

- (void)createDataIfNeeded {
    
// VIV FIXTHIS
//    NSError *error = nil;
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    NSUInteger fetchCount = [self.context countForFetchRequest:request error:&error];
//    if (fetchCount==0) {
        [self createDummyData];
//    }
}

- (void)createDummyData {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    // create all objects and save them to the database

    NSEntityDescription *dogEntityDescription = [NSEntityDescription entityForName:@"Dog"
                                                         inManagedObjectContext:self.context];
    NSManagedObject *dog1 = [[NSManagedObject alloc] initWithEntity:dogEntityDescription
                                          insertIntoManagedObjectContext:self.context];
    
    
    [dog1 setValue:@"Rocky" forKey:@"dogName"];
    [dog1 setValue:[dateFormatter dateFromString:@"2009-01-01"] forKey:@"dogBOD"];
    [dog1 setValue:@"Boxer" forKey:@"dogBreed"];
    [dog1 setValue:@"Love the park" forKey:@"dogDescription"];
    [dog1 setValue:@"Male" forKey:@"dogGender"];
    [dog1 setValue:@"Toronto" forKey:@"dogLocation"];
    [dog1 setValue:@"Roger" forKey:@"dogOwner"];
    
    NSData* data = UIImagePNGRepresentation([UIImage imageNamed:@"dog.png"]);
    [dog1 setValue:data forKey:@"dogPicture"]; // VIV conver to Data
    
    NSManagedObject *dog2 = [[NSManagedObject alloc] initWithEntity:dogEntityDescription
                                     insertIntoManagedObjectContext:self.context];
    
    
    [dog2 setValue:@"Maddy" forKey:@"dogName"];
    [dog2 setValue:[dateFormatter dateFromString:@"2010-02-01"]forKey:@"dogBOD"];
    [dog2 setValue:@"Pomerian" forKey:@"dogBreed"];
    [dog2 setValue:@"Hyperactive" forKey:@"dogDescription"];
    [dog2 setValue:@"Female" forKey:@"dogGender"];
    [dog2 setValue:@"Toronto" forKey:@"dogLocation"];
    [dog2 setValue:@"Maria" forKey:@"dogOwner"];
    NSData* data2 = UIImagePNGRepresentation([UIImage imageNamed:@"dog.png"]);
    [dog2 setValue:data2 forKey:@"dogPicture"];

    
    NSEntityDescription *eventEntityDescription = [NSEntityDescription entityForName:@"Event"
                                                            inManagedObjectContext:self.context];
    Event *event1 = (Event*)[[NSManagedObject alloc] initWithEntity:eventEntityDescription
                                     insertIntoManagedObjectContext:self.context];
    
    
    [event1 setValue:@"275 Bathurst Street" forKey:@"eventAddress"];
    
    NSDate *date = [dateFormatter dateFromString:@"2016-07-31"];
    NSLog(@"%@",date);
    
    [event1 setValue: date forKey:@"eventDate"];
    [event1 setValue:@"Breed dating" forKey:@"eventDescription"];
    [event1 setValue:@"Barktinder" forKey:@"eventTitle"];
    [event1 setValue:dog1 forKey:@"mainDog"];
    
    
    
    Event *event2 = (Event*)[[NSManagedObject alloc] initWithEntity:eventEntityDescription
                                       insertIntoManagedObjectContext:self.context];
    
    
    [event2 setValue:@"275 Bathurst Street" forKey:@"eventAddress"];
    event2.eventDate = date;
    //[event2 setOb:date forKey:@"eventDate"];
    [event2 setValue:@"Annual picnic" forKey:@"eventDescription"];
    [event2 setValue:@"PuppyMon:Games of Bones" forKey:@"eventTitle"];
    [event2 setValue:dog2 forKey:@"mainDog"];
    
    NSError *error = nil;
    
    if (![dog1.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    
    if (![event1.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    
    if (![event2.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
}

- (NSArray<Event *> *)fetchAllEvents {
    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Event"];
    
    //sort an array
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"eventDate" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    self.eventsArray = [context executeFetchRequest:request error:nil];
    NSLog(@"%@",self.eventsArray);
    return self.eventsArray;
}



@end