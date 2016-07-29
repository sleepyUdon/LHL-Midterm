//
//  MyMeetupsTableViewCell.m
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-27.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "MyMeetupsTableViewCell.h"


@implementation MyMeetupsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self drawGradient];
}

- (void)setPetImage:(UIImageView *)petImage {
    _eventImage = petImage;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawGradient
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.eventImage.bounds;
    gradient.colors = @[(id)[UIColor clearColor].CGColor,
                        (id)[UIColor blackColor].CGColor];
    
    gradient.startPoint = CGPointMake(0.5f, .25f);
    gradient.endPoint = CGPointMake(.5f, 1.0);
    
    [self.eventImage.layer addSublayer: gradient];
}



@end
