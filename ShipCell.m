//
//  ShipCell.m
//  everfreight
//
//  Created by Kyle Holsey on 8/6/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "ShipCell.h"
#import <QuartzCore/QuartzCore.h>


@implementation ShipCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _lblContact.layer.masksToBounds = YES;

      _lblContact.layer.cornerRadius = 4;
      
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    

    // Configure the view for the selected state
}

@end
