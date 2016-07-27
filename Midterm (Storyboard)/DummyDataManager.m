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
#import "User.h"

@interface DummyDataManager()
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic,strong)  NSEntityDescription *dogEntityDescription;
@property (nonatomic, strong) NSArray *eventsArray;

@end

@implementation DummyDataManager

#pragma mark - Initializer

-(instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context {
    if (self = [super init]) {
        _context = context;
        [self createDataIfNeeded];
    }
    return self;
}

#pragma mark - Creation of dummy data

- (void)createDataIfNeeded {
    
// VIV FIXTHIS
//    NSError *error = nil;
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    NSUInteger fetchCount = [self.context countForFetchRequest:request error:&error];
    if ([self fetchAllEvents].count == 0) {
        [self createDummyData];
    }
}

- (void)createDummyData {

    /********************************************Dog schema**************************************/
    
    NSDateFormatter *dogDateFormatter = [[NSDateFormatter alloc] init];
    [dogDateFormatter setDateFormat:@"yyyy-MM-dd"];
    Dog *dog1 = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.context];
    
    dog1.dogName = @"Rocky";
    dog1.dogBOD = [dogDateFormatter dateFromString:@"2009-01-01"];
    dog1.dogBreed = @"Boxer";
    dog1.dogDescription = @"Love the park";
    dog1.dogGender = @"Male";
    dog1.dogLocation = @"Toronto";
    dog1.dogOwner = @"Eugene";
    dog1.dogPicture = UIImagePNGRepresentation([UIImage imageNamed:@"boxer"]);
    
    Dog *dog2 = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.context];
    
    dog2.dogName = @"Maddy";
    dog2.dogBOD = [dogDateFormatter dateFromString:@"2016-01-02"];
    dog2.dogBreed = @"Pomeranian";
    dog2.dogDescription = @"Hyperactive";
    dog2.dogGender = @"Female";
    dog2.dogLocation = @"Toronto";
    dog2.dogOwner = @"Viviane";
    dog2.dogPicture = UIImagePNGRepresentation([UIImage imageNamed:@"teacuppomeranian"]);
    
    Dog *dog3 = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.context];
    
    dog3.dogName = @"Chutes";
    dog3.dogBOD = [dogDateFormatter dateFromString:@"2010-01-02"];
    dog3.dogBreed = @"Boston Terrier";
    dog3.dogDescription = @"Sleepy";
    dog3.dogGender = @"Male";
    dog3.dogLocation = @"Toronto";
    dog3.dogOwner = @"Nelson";
    dog3.dogPicture = UIImagePNGRepresentation([UIImage imageNamed:@"bostonterrier"]);
    
    Dog *dog4 = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.context];
    
    dog4.dogName = @"Buzzer";
    dog4.dogBOD = [dogDateFormatter dateFromString:@"2014-08-09"];
    dog4.dogBreed = @"Jack Russel";
    dog4.dogDescription = @"Loves the outdoors";
    dog4.dogGender = @"Male";
    dog4.dogLocation = @"Mississauga";
    dog4.dogOwner = @"Rene";
    dog4.dogPicture = UIImagePNGRepresentation([UIImage imageNamed:@"jackrussel"]);
    
    Dog *dog5 = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.context];
    
    dog5.dogName = @"Luna";
    dog5.dogBOD = [dogDateFormatter dateFromString:@"2010-01-02"];
    dog5.dogBreed = @"Labrador Retriever";
    dog5.dogDescription = @"Hyperactive";
    dog5.dogGender = @"Female";
    dog5.dogLocation = @"Toronto";
    dog5.dogOwner = @"Neil";
    dog5.dogPicture = UIImagePNGRepresentation([UIImage imageNamed:@"labradorretriever"]);
    
    Dog *dog6 = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.context];
    
    dog6.dogName = @"Gruff";
    dog6.dogBOD = [dogDateFormatter dateFromString:@"2015-01-04"];
    dog6.dogBreed = @"Rottweiller";
    dog6.dogDescription = @"Loves cats";
    dog6.dogGender = @"Female";
    dog6.dogLocation = @"Toronto";
    dog6.dogOwner = @"Myra";
    dog6.dogPicture = UIImagePNGRepresentation([UIImage imageNamed:@"rottweiler"]);
    
    Dog *dog7 = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.context];
    
    dog7.dogName = @"Square";
    dog7.dogBOD = [dogDateFormatter dateFromString:@"2016-06-05"];
    dog7.dogBreed = @"Mascot";
    dog7.dogDescription = @"Mascot";
    dog7.dogGender = @"Female";
    dog7.dogLocation = @"Toronto";
    dog7.dogOwner = @"Open Bark";
    dog7.dogPicture = UIImagePNGRepresentation([UIImage imageNamed:@"squarefacedpoodle"]);
    
    
    /****************************************User schema***************************************/
    
    User *user1 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
    
    user1.userName = @"Eugene";
    user1.password = @"";
    user1.dog = dog1;
    
    
    User *user2 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
    
    user2.userName = @"Viviane";
    user2.password = @"";
    user2.dog = dog2;

    User *user3 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
    
    user3.userName = @"Nelson";
    user3.password = @"";
    user3.dog = dog3;

    User *user4 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
    
    user4.userName = @"Rene";
    user4.password = @"";
    user4.dog = dog4;

    User *user5 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
    
    user5.userName = @"Neil";
    user5.password = @"";
    user5.dog = dog5;

    User *user6 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
    
    user6.userName = @"Myra";
    user6.password = @"";
    user6.dog = dog6;

    User *user7 = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
    
    user7.userName = @"Open Bark";
    user7.password = @"";
    user7.dog = dog7;
    
    
    /**************************************Event schema*******************************************/

    NSDateFormatter *eventDateFormatter = [[NSDateFormatter alloc] init];
    [eventDateFormatter setDateFormat:@"yyyy-MM-dd hh:mm a"];
    //[eventDateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    
    
    Event *event1 = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.context];
    event1.eventTitle = @"Puppymon: Game of Bones ";
    event1.eventAddress = @"2000 Meadowvale Rd, Toronto, ON M1B 5K7";
    event1.eventOrganizer = @"Eug";
    event1.eventDate = [eventDateFormatter dateFromString:@"2016-07-25 08:00 AM"];
    event1.eventDescription = @"Bring your dog and food";
    event1.mainDog = dog1;

    [event1 addDogObject:dog1];
    [event1 addDogObject:dog2];
    [event1 addDogObject:dog3];
    [event1 addDogObject:dog4];
    [event1 addDogObject:dog5];
    [event1 addDogObject:dog6];
    
    Event *event2 = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.context];
    event2.eventTitle = @"Yoga Mutts";
    event2.eventAddress = @"156 Jozo Weider Blvd, The Blue Mountains, ON L9Y 3Z2";
    event2.eventOrganizer = @"Viv";
    event2.eventDate = [eventDateFormatter dateFromString:@"2016-07-29 12:30 PM"];
    event2.eventDescription = @"Bring your own mat";
    event2.mainDog = dog2;
    
    [event2 addDogObject:dog2];
    [event2 addDogObject:dog3];
    [event2 addDogObject:dog4];
    [event2 addDogObject:dog5];
    
    Event *event3 = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.context];
    event3.eventTitle = @"Dawg Gone Eat";
    event3.eventAddress = @"7700 Hurontario Street, Unit 602, Brampton L6Y 4M3";
    event3.eventOrganizer = @"Rene";
    event3.eventDate = [eventDateFormatter dateFromString:@"2016-07-30 11:00 AM"];
    event3.eventDescription = @"Bring food and plates";
    event3.mainDog = dog4;
    
    [event3 addDogObject:dog3];
    [event3 addDogObject:dog4];
    [event3 addDogObject:dog5];
    [event3 addDogObject:dog6];
    
    
    Event *event4 = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.context];
    event4.eventTitle = @"Barktinder : Breed Dating";
    event4.eventAddress = @"14184 Niagara Parkway, Niagara-on-the-Lake, ON L0S 1J0";
    event4.eventOrganizer = @"Open Bark";
    event4.eventDate = [eventDateFormatter dateFromString:@"2016-07-30 5:00 PM"];
    event4.eventDescription = @"We need shepard female dogs";
    event4.mainDog = dog7;

    [event4 addDogObject:dog1];
    [event4 addDogObject:dog2];
    [event4 addDogObject:dog3];
    [event4 addDogObject:dog4];
    [event4 addDogObject:dog5];
    [event4 addDogObject:dog6];
    [event4 addDogObject:dog7];
    
    NSError *error = nil;
    if ([self.context save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    
}

#pragma mark - Fetching all events

- (NSArray<Event *> *)fetchAllEvents {
    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Event"];
    
    //sort an array
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"eventDate" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    self.eventsArray = [context executeFetchRequest:request error:nil];
    //NSLog(@"%@",self.eventsArray);
    return self.eventsArray;
}



@end