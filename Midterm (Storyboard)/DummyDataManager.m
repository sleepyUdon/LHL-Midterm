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


@implementation DummyDataManager

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSEntityDescription *dogEntityDescription = [NSEntityDescription entityForName:@"Dog"
                                                         inManagedObjectContext:self.managedObjectContext];
    NSManagedObject *dog1 = [[NSManagedObject alloc] initWithEntity:dogEntityDescription
                                          insertIntoManagedObjectContext:self.managedObjectContext];
    
    
    [dog1 setValue:@"Rocky" forKey:@"dogName"];
    [dog1 setValue:@"2009-03-31" forKey:@"dogBOD"];
    [dog1 setValue:@"Boxer" forKey:@"dogBreed"];
    [dog1 setValue:@"Love the park" forKey:@"dogDescription"];
    [dog1 setValue:@"Male" forKey:@"dogGender"];
    [dog1 setValue:@"Toronto" forKey:@"dogLocation"];
    [dog1 setValue:@"Roger" forKey:@"dogOwner"];
    [dog1 setValue:@"boxer.png" forKey:@"dogPicture"];
    
    
    NSEntityDescription *eventEntityDescription = [NSEntityDescription entityForName:@"Event"
                                                            inManagedObjectContext:self.managedObjectContext];
    NSManagedObject *event1 = [[NSManagedObject alloc] initWithEntity:eventEntityDescription
                                     insertIntoManagedObjectContext:self.managedObjectContext];
    
    
    [event1 setValue:@"275 Bathurst Street" forKey:@"eventAddress"];
    [event1 setValue:@"2016-07-31" forKey:@"eventDate"];
    [event1 setValue:@"Breed dating" forKey:@"eventDescription"];
    [event1 setValue:@"Barktinder" forKey:@"eventTitle"];
    
    
    NSManagedObject *event2 = [[NSManagedObject alloc] initWithEntity:eventEntityDescription
                                       insertIntoManagedObjectContext:self.managedObjectContext];
    
    
    [event2 setValue:@"275 Bathurst Street" forKey:@"eventAddress"];
    [event2 setValue:@"2016-07-31" forKey:@"eventDate"];
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
    
    
    return YES;
}



@end