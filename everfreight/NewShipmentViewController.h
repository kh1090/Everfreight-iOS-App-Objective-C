//
//  NewShipmentViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 7/8/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadInfoViewController.h"


@interface NewShipmentViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource> {
    
    IBOutlet UIScrollView *scroller;
    
}
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UILabel *lblDATE;


@property (weak, nonatomic) IBOutlet UITextField *txtAddress;

@property (weak, nonatomic) IBOutlet UITextField *txtDateTime;
@property (weak, nonatomic) IBOutlet UITextField *txtRef1;
@property (weak, nonatomic) IBOutlet UITextField *txtRef2;
@property (weak, nonatomic) IBOutlet UITextField *fieldPickupNotes;


@property (weak, nonatomic) IBOutlet UITextField *txtDropName;
@property (weak, nonatomic) IBOutlet UITextField *txtDropAddress;
@property (weak, nonatomic) IBOutlet UITextField *txtDropDateTime;
@property (weak, nonatomic) IBOutlet UITextField *txtDropRef1;
@property (weak, nonatomic) IBOutlet UITextField *txtDropRef2;
@property (weak, nonatomic) IBOutlet UITextField *fieldDropoffNotes;











@end
