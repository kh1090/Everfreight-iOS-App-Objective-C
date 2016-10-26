//
//  QuickQuoteViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 7/11/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Kumulos.h"
#import <MessageUI/MessageUI.h>

@interface QuickQuoteViewController : UIViewController<UITextViewDelegate, MFMailComposeViewControllerDelegate, KumulosDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *txtPickupZip;
@property (weak, nonatomic) IBOutlet UITextField *txtDropoffZip;

@property (weak, nonatomic) IBOutlet UITextField *txtPieceCount;
@property (weak, nonatomic) IBOutlet UITextField *txtWeight;


@property (weak, nonatomic) IBOutlet UITextField *txtEquipmentType;
@property (weak, nonatomic) IBOutlet UITextField *txtAccessories;










@end
