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

    // create all objects and save them to the database

    NSEntityDescription *dogEntityDescription = [NSEntityDescription entityForName:@"Dog"
                                                         inManagedObjectContext:self.context];
    NSManagedObject *dog1 = [[NSManagedObject alloc] initWithEntity:dogEntityDescription
                                          insertIntoManagedObjectContext:self.context];
    
    
    [dog1 setValue:@"Rocky" forKey:@"dogName"];
    [dog1 setValue:[dateFormatter dateFromString:@"01-01-2009"] forKey:@"dogBOD"];
    [dog1 setValue:@"Boxer" forKey:@"dogBreed"];
    [dog1 setValue:@"Love the park" forKey:@"dogDescription"];
    [dog1 setValue:@"Male" forKey:@"dogGender"];
    [dog1 setValue:@"Toronto" forKey:@"dogLocation"];
    [dog1 setValue:@"Roger" forKey:@"dogOwner"];
    NSString* str = @"boxer.png";
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [dog1 setValue:data forKey:@"dogPicture"]; // VIV conver to Data
    
    NSManagedObject *dog2 = [[NSManagedObject alloc] initWithEntity:dogEntityDescription
                                     insertIntoManagedObjectContext:self.context];
    
    
    [dog2 setValue:@"Maddy" forKey:@"dogName"];
    [dog2 setValue:[dateFormatter dateFromString:@"01-02-2010"]forKey:@"dogBOD"];
    [dog2 setValue:@"Pomerian" forKey:@"dogBreed"];
    [dog2 setValue:@"Hyperactive" forKey:@"dogDescription"];
    [dog2 setValue:@"Female" forKey:@"dogGender"];
    [dog2 setValue:@"Toronto" forKey:@"dogLocation"];
    [dog2 setValue:@"Maria" forKey:@"dogOwner"];
    NSString* str1 = @"pomerian.png";
    NSData* data2= [str1 dataUsingEncoding:NSUTF8StringEncoding];
    [dog2 setValue:data2 forKey:@"dogPicture"];

    
    NSEntityDescription *eventEntityDescription = [NSEntityDescription entityForName:@"Event"
                                                            inManagedObjectContext:self.context];
    NSManagedObject *event1 = [[NSManagedObject alloc] initWithEntity:eventEntityDescription
                                     insertIntoManagedObjectContext:self.context];
    
    
    [event1 setValue:@"275 Bathurst Street" forKey:@"eventAddress"];
    [event1 setValue:[dateFormatter dateFromString:@"2016-07-31"]forKey:@"eventDate"];
    [event1 setValue:@"Breed dating" forKey:@"eventDescription"];
    [event1 setValue:@"Barktinder" forKey:@"eventTitle"];
    
    
    NSManagedObject *event2 = [[NSManagedObject alloc] initWithEntity:eventEntityDescription
                                       insertIntoManagedObjectContext:self.context];
    
    
    [event2 setValue:@"275 Bathurst Street" forKey:@"eventAddress"];
    [event2 setValue:[dateFormatter dateFromString:@"2016-07-31"] forKey:@"eventDate"];
    [event2 setValue:@"Annual picnic" forKey:@"eventDescription"];
    [event2 setValue:@"PuppyMon:Games of Bones" forKey:@"eventTitle"];
    
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
    return nil;
}



@end