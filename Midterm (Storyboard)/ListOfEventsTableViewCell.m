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
    [self drawGradient];
}

- (void)setPetImage:(UIImageView *)petImage {
    _petImage = petImage;
}


- (void)drawGradient
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.petImage.bounds;
    gradient.colors = @[(id)[UIColor clearColor].CGColor,
                        (id)[UIColor blackColor].CGColor];
    
    gradient.startPoint = CGPointMake(0.5f, .25f);
    gradient.endPoint = CGPointMake(.5f, 1.0);
    
    [self.petImage.layer addSublayer: gradient];
}


@end
