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
#import "Dog.h"

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

//    NSEntityDescription *dogEntity = [NSEntityDescription entityForName:@"Dog" inManagedObjectContext:self.context];
//    
//    Dog *dog1 = [[NSManagedObject alloc] initWithEntity:dogEntity insertIntoManagedObjectContext:self.context];
    
    Dog *dog1 = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.context];
    
    dog1.dogName = @"Rocky";
    dog1.dogBOD = [dateFormatter dateFromString:@"01-01-2009"];
    dog1.dogBreed = @"Boxer";
    dog1.dogDescription = @"Love the park";
    dog1.dogGender = @"Male";
    dog1.dogLocation = @"Toronto";
    dog1.dogOwner = @"Roger";
    dog1.dogPicture = UIImagePNGRepresentation([UIImage imageNamed:@"boxer"]);
    
    Dog *dog2 = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.context];
    
    dog2.dogName = @"Maddy";
    dog2.dogBOD = [dateFormatter dateFromString:@"01-02-2010"];
    dog2.dogBreed = @"Pomeranian";
    dog2.dogDescription = @"Hyperactive";
    dog2.dogGender = @"Female";
    dog2.dogLocation = @"Toronto";
    dog2.dogOwner = @"Maria";
    dog2.dogPicture = UIImagePNGRepresentation([UIImage imageNamed:@"boxer"]);

    
    
//    Event *event1 = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.context];
//    
//    
////    NSEntityDescription *eventEntityDescription = [NSEntityDescription entityForName:@"Event"
////                                                            inManagedObjectContext:self.context];
////    NSManagedObject *event1 = [[NSManagedObject alloc] initWithEntity:eventEntityDescription
////                                     insertIntoManagedObjectContext:self.context];
//    
//    event1.eventTitle = @"Barktinder";
//    event1.eventDescription = @"Breed Dating";
//    event1.eventAddress =
//    event1.eventDate = [dateFormatter dateFromString:@"2016-07-31"];
//    event1.eventOrganizer = @"Open Bark";
    
    Event *event = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.context];
    event.eventTitle = @"Puppymon: Game of Bones ";
    event.eventAddress = @"2000 Meadowvale Rd, Toronto, ON M1B 5K7";
    event.eventOrganizer = @"Eug";
    event.eventDate = @"July 29, 2016 8:00 AM";
    
    Event *otherEvent = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.context];
    otherEvent.eventTitle = @"Yoga Mutts";
    otherEvent.eventAddress = @"156 Jozo Weider Blvd, The Blue Mountains, ON L9Y 3Z2";
    otherEvent.eventOrganizer = @"Viv";
    otherEvent.eventDate = @"July 29, 2016 12:30 PM";
    
    Event *someOtherEvent = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.context];
    someOtherEvent.eventTitle = @"Dawg Gone Eat";
    someOtherEvent.eventAddress = @"7700 Hurontario Street, Unit 602, Brampton L6Y 4M3";
    someOtherEvent.eventOrganizer = @"Rene";
    someOtherEvent.eventDate = @" July 29, 2016 6:00 PM";
    
    Event *lateNightEvent = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.context];
    lateNightEvent.eventTitle = @"Barktinder : Breed Dating";
    lateNightEvent.eventAddress = @"14184 Niagara Parkway, Niagara-on-the-Lake, ON L0S 1J0";
    lateNightEvent.eventOrganizer = @"Open Bark";
    lateNightEvent.eventDate = @"July 30, 2016 1:00 AM";

    
//    [event1 setValue:@"14184 Niagara Parkway, Niagara-on-the-Lake, ON L0S 1J0" forKey:@"eventAddress"];
//    [event1 setValue:[dateFormatter dateFromString:@"2016-07-31"]forKey:@"eventDate"];
//    [event1 setValue:@"Breed dating" forKey:@"eventDescription"];
//    [event1 setValue:@"Barktinder" forKey:@"eventTitle"];
//    
//    
//    NSManagedObject *event2 = [[NSManagedObject alloc] initWithEntity:eventEntityDescription
//                                       insertIntoManagedObjectContext:self.context];
//    
//    
//    [event2 setValue:@"2000 Meadowvale Rd, Toronto, ON M1B 5K7" forKey:@"eventAddress"];
//    [event2 setValue:[dateFormatter dateFromString:@"2016-07-31"] forKey:@"eventDate"];
//    [event2 setValue:@"Annual picnic" forKey:@"eventDescription"];
//    [event2 setValue:@"PuppyMon:Games of Bones" forKey:@"eventTitle"];
//    
//    NSManagedObject *event3 = [[NSManagedObject alloc] initWithEntity:eventEntityDescription
//                                       insertIntoManagedObjectContext:self.context];
//    
//    [event3 setValue:@"7700 Hurontario Street, Unit 602, Brampton L6Y 4M3" forKey:@"eventAddress"];
//    [event3 setValue:[dateFormatter dateFromString:@"2016-07-31"] forKey:@"eventDate"];
//    [event3 setValue:@"Annual picnic" forKey:@"eventDescription"];
//    [event3 setValue:@"Dawg Gone Eat" forKey:@"eventTitle"];
//    
//   NSManagedObject *event4 = [[NSManagedObject alloc] initWithEntity:eventEntityDescription
//                                       insertIntoManagedObjectContext:self.context];
//    
//    [event4 setValue:@"156 Jozo Weider Blvd, The Blue Mountains, ON L9Y 3Z2" forKey:@"eventAddress"];
//    [event4 setValue:[dateFormatter dateFromString:@"2016-07-31"] forKey:@"eventDate"];
//    [event4 setValue:@"Dinner Date" forKey:@"eventDescription"];
//    [event4 setValue:@"Yoga Mutt" forKey:@"eventTitle"];
    
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