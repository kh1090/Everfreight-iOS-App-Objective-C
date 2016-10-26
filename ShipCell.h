//
//  ShipCell.h
//  everfreight
//
//  Created by Kyle Holsey on 8/6/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShipCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblPickupAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblLoadWeight;
@property (weak, nonatomic) IBOutlet UILabel *lblEquipmentType;
@property (weak, nonatomic) IBOutlet UIButton *btnContact;
@property (weak, nonatomic) IBOutlet UILabel *lblCarrierName;
@property (weak, nonatomic) IBOutlet UILabel *lblContact;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *lblPickUp;
@property (weak, nonatomic) IBOutlet UILabel *lblDropOff;
@property (weak, nonatomic) IBOutlet UILabel *lblWeight;
@property (weak, nonatomic) IBOutlet UILabel *lblEquip;

@end
