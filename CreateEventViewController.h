//
//  CreateEventViewController.h
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface CreateEventViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIImageView *petImageView;
@property (weak, nonatomic) IBOutlet UILabel *petName;
@property (weak, nonatomic) IBOutlet UITextField *eventTitle;
@property (weak, nonatomic) IBOutlet UITextField *eventAddress;
@property (weak, nonatomic) IBOutlet UITextField *eventDate;
@property (weak, nonatomic) IBOutlet UITextField *shortDescription;
@property (weak, nonatomic) IBOutlet UITextField *organizer;

@end