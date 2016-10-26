//
//  driverLogInViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 8/24/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Kumulos.h"
#include <QuartzCore/QuartzCore.h>


@interface driverLogInViewController : UIViewController<UITextFieldDelegate, KumulosDelegate>{

    
    
}

-(void)rememberLogInDetails;


@property (weak, nonatomic) IBOutlet UITextField *txtEmail;

@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@property (weak, nonatomic) IBOutlet UIButton *btnLogIn;

@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;

@property (weak, nonatomic) IBOutlet UISwitch *rememberSwitch;
@property (weak, nonatomic) IBOutlet UIButton *btnRemember;
@property (weak, nonatomic) IBOutlet UIButton *btnErase;


@end
