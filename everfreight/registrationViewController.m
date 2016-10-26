//
//  registrationViewController.m
//  everfreight
//
//  Created by Kyle Holsey on 8/23/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "registrationViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface registrationViewController ()

@end

@implementation registrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIColor *color = [UIColor groupTableViewBackgroundColor];
    
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{ NSForegroundColorAttributeName:color, NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:17.0] }];
    self.txtEmail.attributedPlaceholder = str;
    
    
    
    NSAttributedString *str2 = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{ NSForegroundColorAttributeName:color, NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:17.0] }];
    self.txtPassword.attributedPlaceholder = str2;
    
    NSAttributedString *str3 = [[NSAttributedString alloc] initWithString:@"Contact Name" attributes:@{ NSForegroundColorAttributeName:color, NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:17.0] }];
    self.txtCompanyName.attributedPlaceholder = str3;
    
    NSAttributedString *str7 = [[NSAttributedString alloc] initWithString:@"Company Name" attributes:@{ NSForegroundColorAttributeName:color, NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:17.0] }];
    self.txtContactName.attributedPlaceholder = str7;

    
    NSAttributedString *str5 = [[NSAttributedString alloc] initWithString:@"Contact #" attributes:@{ NSForegroundColorAttributeName:color, NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:17.0] }];
    self.txtContact.attributedPlaceholder = str5;
    
    
    NSAttributedString *str6 = [[NSAttributedString alloc] initWithString:@"Confirm Password" attributes:@{ NSForegroundColorAttributeName:color, NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:17.0] }];
    self.txtConfirmPassword.attributedPlaceholder = str6 ;

    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];
    
    self.navigationController.navigationBar.translucent = NO;
    
    _btnRegister.layer.cornerRadius = 4;
    _btnRegister.clipsToBounds=YES;
    
    
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)userDoneEnteringText:(id)sender
    {
        [sender resignFirstResponder];
        // do whatever you want with this text field
    }

- (IBAction)btnTermsOfPressed:(id)sender {
    
    
    
    
    
}



- (IBAction)btnRegisterPressed:(id)sender {
    
    NSString* companyName  = [(UITextField*)[[self view] viewWithTag:7]text];
    NSString* contactNumber  = [(UITextField*)[[self view] viewWithTag:2]text];
    NSString* email     = [(UITextField*)[[self view] viewWithTag:3]text];
    NSString* password  = [(UITextField*)[[self view] viewWithTag:4]text];
    NSString* confirmPassword     = [(UITextField*)[[self view] viewWithTag:5]text];
    NSString* contactName     = [(UITextField*)[[self view] viewWithTag:1]text];

    
    if (contactName.length == 0 || companyName.length == 0 || contactNumber.length==0 || email.length==0 || password.length==0  || confirmPassword.length == 0) {
    
        UIAlertView* alert = [[UIAlertView alloc]init];
        [alert addButtonWithTitle:@"OK"];
        [alert setDelegate:nil];
        [alert setTitle:@"Missing Info"];
        [alert setMessage:@"One or more fields are missing."];
        [alert show];
        return;
        
    
        
    }
    
    else if (_txtPassword.text.length != _txtConfirmPassword.text.length)
    {
        
        
        UIAlertView* alert = [[UIAlertView alloc]init];
        [alert addButtonWithTitle:@"OK"];
        [alert setDelegate:nil];
        [alert setTitle:@"Password Error"];
        [alert setMessage:@"Passwords do not match."];
        [alert show];
        return;
        
    }
    
    else if (contactName.length > 0 && companyName.length > 0 && contactNumber.length>0 && email.length>0 && password.length>0  && confirmPassword.length>0 &&_txtPassword.text.length == _txtConfirmPassword.text.length)
        
    {
        
        if([self isValidEmail:_txtEmail.text])
            //Valid
        {//We want to register
    Kumulos* k = [[Kumulos alloc]init];
    [k setDelegate:self];
            [k addNewShipperWithShipperName:companyName andShipperContact:contactNumber andShipperEmail:email andShipperPassword:password andContactName:contactName];
                    
        
        [self performSegueWithIdentifier:@"registerToLog" sender:self];
        
        }
        
        else {
            
            
            
            
            UIAlertView* alert = [[UIAlertView alloc]init];
            [alert addButtonWithTitle:@"OK"];
            [alert setDelegate:nil];
            [alert setTitle:@"Invalid Email"];
            [alert setMessage:@"Please enter a valid email address."];
            [alert show];
    
            
            
            
            
        }
        
    
        }
}

- (void) kumulosAPI:(Kumulos *)kumulos apiOperation:(KSAPIOperation *)operation addNewShipperDidCompleteWithResult:(NSNumber *)newRecordID

{
    
    
    
    [self performSegueWithIdentifier:@"registerToLog" sender:self];
    
    UIAlertView* alert = [[UIAlertView alloc]init];
    [alert addButtonWithTitle:@"OK"];
    [alert setDelegate:nil];
    [alert setTitle:@"Shipper Account Created"];
    [alert setMessage:@"Shipper account has been successfully created. You may now log in to everfreight."];
    [alert show];

    
    
    
}

-(BOOL) isValidEmail:(NSString *)checkString
{
    checkString = [checkString lowercaseString];
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:checkString];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
