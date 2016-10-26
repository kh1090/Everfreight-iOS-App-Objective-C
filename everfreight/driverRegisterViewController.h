//
//  driverRegisterViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 8/24/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Kumulos.h"
#import <QuartzCore/QuartzCore.h>

@interface driverRegisterViewController : UIViewController<UITextFieldDelegate, KumulosDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtCompany;
@property (weak, nonatomic) IBOutlet UITextField *txtMC;
@property (weak, nonatomic) IBOutlet UITextField *txtContact;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;

@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@property (weak, nonatomic) IBOutlet UITextField *txtConfirmPassword;

@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;

@property (weak, nonatomic) IBOutlet UITextField *txtContactName;


@end
