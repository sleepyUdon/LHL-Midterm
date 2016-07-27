//
//  ListOfEventsTableViewCell.m
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "ListOfEventsTableViewCell.h"

@implementation ListOfEventsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
    UIImage *image1 = [UIImage imageNamed:@"dogPack"];
    UIImage *image2 = [UIImage imageNamed:@"dogPack1"];
    UIImage *image3 = [UIImage imageNamed:@"dogPack2"];
    UIImage *image4 = [UIImage imageNamed:@"dogPack3"];
    UIImage *image5 = [UIImage imageNamed:@"dogPack4"];

    
    NSArray *images = @[image1, image2, image3, image4, image5];
    UIImage *randomImage = [images objectAtIndex:arc4random_uniform((int)(images.count - 1))];


    self.imageView.image = randomImage;
}



@end
