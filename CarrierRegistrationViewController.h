//
//  CarrierRegistrationViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 8/30/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Kumulos.h"


@interface CarrierRegistrationViewController : UIViewController<UITextFieldDelegate, KumulosDelegate>


@property (weak, nonatomic) IBOutlet UIButton *btnRegister;
@property (weak, nonatomic) IBOutlet UITextField *txtCompanyName;

@property (weak, nonatomic) IBOutlet UITextField *txtMC;

@property (weak, nonatomic) IBOutlet UITextField *txtContactNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtConfirmPassword;

@property (weak, nonatomic) IBOutlet UITextField *txtContactName;

@property (weak, nonatomic) IBOutlet UITextView *privacyView;
@property (weak, nonatomic) IBOutlet UIButton *btnTerms;
@property (weak, nonatomic) IBOutlet UIButton *btnTerms2;
@property (weak, nonatomic) IBOutlet UIButton *btnPrivacyPolicy;

@end
