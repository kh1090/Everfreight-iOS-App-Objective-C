//
//  LoadInfoViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 7/10/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadInfoViewController : UIViewController<UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>{
    
}


@property (strong, nonatomic)  NSString *stringFromTextField;
@property (strong, nonatomic)  NSString *pickupAddress;

@property (strong, nonatomic)  NSString *pickupDateTime;

@property (strong, nonatomic)  NSString *pickupRef1;

@property (strong, nonatomic)  NSString *pickupRef2;

@property (strong, nonatomic)  NSString *dropoffName;

@property (strong, nonatomic)  NSString *dropoffAddress;

@property (strong, nonatomic)  NSString *dropoffDateTime;

@property (strong, nonatomic)  NSString *dropoffRef1;

@property (strong, nonatomic)  NSString *dropoffRef2;

@property (strong, nonatomic)  NSString *dropoffNotes;

@property (strong, nonatomic)  NSString *pickupNotes;



@property (weak, nonatomic) IBOutlet UITextField *txtLoadType;

@property (weak, nonatomic) IBOutlet UITextField *txtPieceCount;
@property (weak, nonatomic) IBOutlet UITextField *txtDimensions;
@property (weak, nonatomic) IBOutlet UITextField *txtWeight;
@property (weak, nonatomic) IBOutlet UITextField *txtValue;

@property (weak, nonatomic) IBOutlet UITextField *txtEquipmentType;
@property (weak, nonatomic) IBOutlet UITextField *txtAccessories;


@property (weak, nonatomic) IBOutlet UIView *dataView;


@property (weak, nonatomic) IBOutlet UILabel *lblPickupName;
@property (weak, nonatomic) IBOutlet UILabel *lblPickupAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblPickupDateTime;
@property (weak, nonatomic) IBOutlet UILabel *lblPickupRef1;
@property (weak, nonatomic) IBOutlet UILabel *lblPickupRef2;
@property (weak, nonatomic) IBOutlet UILabel *lblPickupNotes;

@property (weak, nonatomic) IBOutlet UILabel *lblDropoffName;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffDateTime;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffRef1;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffRef2;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffNotes;















@end
