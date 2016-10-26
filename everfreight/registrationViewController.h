//
//  registrationViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 8/23/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Kumulos.h"
#import <QuartzCore/QuartzCore.h>


@interface registrationViewController : UIViewController<UITextFieldDelegate, KumulosDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtConfirmPassword;

@property (weak, nonatomic) IBOutlet UITextField *txtContact;
@property (weak, nonatomic) IBOutlet UITextField *txtCompanyName;

@property (weak, nonatomic) IBOutlet UIButton *btnRegister;

@property (weak, nonatomic) IBOutlet UITextField *txtContactName;



@end
