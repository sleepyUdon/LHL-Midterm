//
//  Event+CoreDataProperties.h
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Event.h"

NS_ASSUME_NONNULL_BEGIN

@interface Event (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *eventAddress;
@property (nullable, nonatomic, retain) NSDate *eventDate;
@property (nullable, nonatomic, retain) NSString *eventDescription;
@property (nullable, nonatomic, retain) NSString *eventTitle;
@property (nullable, nonatomic, retain) NSString *eventOrganizer;
@property (nullable, nonatomic, retain) NSSet<Dog *> *dog;

@end

@interface Event (CoreDataGeneratedAccessors)

- (void)addDogObject:(Dog *)value;
- (void)removeDogObject:(Dog *)value;
- (void)addDog:(NSSet<Dog *> *)values;
- (void)removeDog:(NSSet<Dog *> *)values;

@end

NS_ASSUME_NONNULL_END
