//
//  EventDetailViewController.h
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventDetailViewController : UIViewController

@property (strong, nonatomic) Event *event;
@property (weak, nonatomic) IBOutlet UILabel *eventTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventOrganizerLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventDateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *organizerImageView;
@property (weak, nonatomic) IBOutlet UITextView *eventDescriptionLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
