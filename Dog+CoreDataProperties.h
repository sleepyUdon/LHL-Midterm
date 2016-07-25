//
//  Dog+CoreDataProperties.h
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Dog.h"

NS_ASSUME_NONNULL_BEGIN

@interface Dog (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *dogPicture;
@property (nullable, nonatomic, retain) NSString *dogName;
@property (nullable, nonatomic, retain) NSString *dogBreed;
@property (nullable, nonatomic, retain) NSString *dogGender;
@property (nullable, nonatomic, retain) NSDate *dogBOD;
@property (nullable, nonatomic, retain) NSString *dogOwner;
@property (nullable, nonatomic, retain) NSString *dogDescription;
@property (nullable, nonatomic, retain) NSString *dogLocation;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *event;
@property (nullable, nonatomic, retain) Dog *user;

@end

@interface Dog (CoreDataGeneratedAccessors)

- (void)addEventObject:(NSManagedObject *)value;
- (void)removeEventObject:(NSManagedObject *)value;
- (void)addEvent:(NSSet<NSManagedObject *> *)values;
- (void)removeEvent:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
