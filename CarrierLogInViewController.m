//
//  CarrierLogInViewController.m
//  everfreight
//
//  Created by Kyle Holsey on 8/30/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "CarrierLogInViewController.h"
#import "KeychainItemWrapper.h"

@interface CarrierLogInViewController ()

@end

@implementation CarrierLogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _btnErase.hidden=TRUE;
    _btnRemember.hidden=FALSE;
    
    
    
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"CarrierLogin" accessGroup:nil];
    
    
    
    NSString *passwordCarrier = [keychainItem objectForKey:kSecValueData];
    NSString *usernameCarrier = [keychainItem objectForKey:kSecAttrAccount];
    
    
    if ([_btnRemember isHidden]){
        
        
        _txtEmail.text = @"";
        _txtPassword.text = @"";
        
        
        
    }
    else {
        
        _txtEmail.text = usernameCarrier;
        _txtPassword.text = passwordCarrier;
        
        
    }
    

    
    
    UIColor *color = [UIColor groupTableViewBackgroundColor];
      
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{ NSForegroundColorAttributeName:color, NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:17.0] }];
    self.txtEmail.attributedPlaceholder = str;
    
    
    
    NSAttributedString *str2 = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{ NSForegroundColorAttributeName:color, NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:17.0] }];
    self.txtPassword.attributedPlaceholder = str2;
    
    
    
    
    _btnSignUp.layer.cornerRadius = 4;
    _btnSignUp.clipsToBounds=YES;
    
    _btnLogIn.layer.cornerRadius=4;
    _btnLogIn.clipsToBounds=YES;
    
      
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnSignUpPressed:(id)sender {
    
    if (_txtPassword.text.length == 0 && _txtEmail.text.length ==0){
        
        [self performSegueWithIdentifier:@"carrierToSign" sender:self];
    }
    
    else if (_txtPassword.text.length == 0 && _txtEmail.text.length > 0)
    {
        
        UIAlertView* alert = [[UIAlertView alloc]init];
        [alert addButtonWithTitle:@"OK"];
        [alert setDelegate:nil];
        
        [alert setTitle:@"Error"];
        [alert setMessage:@"Please clear email and/or password fields."];
        
        [alert show];
        
        
    }
    
    else if (_txtPassword.text.length > 0 && _txtEmail.text.length == 0)
    {
        
        UIAlertView* alert = [[UIAlertView alloc]init];
        [alert addButtonWithTitle:@"OK"];
        [alert setDelegate:nil];
        
        [alert setTitle:@"Error"];
        [alert setMessage:@"Please clear email and/or password fields."];
        
        [alert show];
        
        
    }
    else if (_txtPassword.text.length > 0 && _txtEmail.text.length > 0)
    {
        
        UIAlertView* alert = [[UIAlertView alloc]init];
        [alert addButtonWithTitle:@"OK"];
        [alert setDelegate:nil];
        
        [alert setTitle:@"Error"];
        [alert setMessage:@"Please clear email and/or password fields."];
        
        [alert show];
        
        
    }
    

    
}
- (IBAction)btnErasePressed:(id)sender {
    
    _btnRemember.hidden = FALSE;
    _btnErase.hidden = TRUE;
    
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"CarrierLogin" accessGroup:nil];
    
    
    [keychainItem setObject:_txtPassword.text forKey:kSecValueData];
    [keychainItem setObject:_txtEmail.text forKey:kSecAttrAccount];
    
    
    
}
- (IBAction)btnRememberPressed:(id)sender {
    
    _btnRemember.hidden=TRUE;
    _btnErase.hidden=FALSE;

}


- (IBAction)btnLogInPressed:(id)sender {
    
    if ([_btnErase isHidden]){
        
        KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"CarrierLogin" accessGroup:nil];
        
        
        [keychainItem setObject:_txtPassword.text forKey:kSecValueData];
        [keychainItem setObject:_txtEmail.text forKey:kSecAttrAccount];
     
        
    }

    
    //we want to log user in
    NSString* email = _txtEmail.text;
    
    NSString* password = _txtPassword.text;
    
    Kumulos* k = [[Kumulos alloc]init];
    [k setDelegate:self];
    
    [k carrierLogInWithPassword:password andEmail:email];
     
    
     if (_txtEmail.text.length== 0 && _txtPassword.text.length == 0){
         

        
        UIAlertView* alert = [[UIAlertView alloc]init];
        [alert addButtonWithTitle:@"OK"];
        [alert setDelegate:nil];
        
        
        [alert setTitle:@"Carrier Account Not Found"];
        [alert setMessage:@"Incorrect username and/or password."];
        [alert show];

        
        
    }
    
    if (_txtEmail.text.length > 0 && _txtPassword.text.length ==0)
    {

        
        UIAlertView* alert = [[UIAlertView alloc]init];
        [alert addButtonWithTitle:@"OK"];
        [alert setDelegate:nil];
        
        [alert setTitle:@"Carrier Account Not Found"];
        [alert setMessage:@"Incorrect username and/or password."];
        
        [alert show];
        
        
    }
    
    if (_txtEmail.text.length == 0 && _txtPassword.text.length >0)
    {

        
        UIAlertView* alert = [[UIAlertView alloc]init];
        [alert addButtonWithTitle:@"OK"];
        [alert setDelegate:nil];
        
        [alert setTitle:@"Carrier Account Not Found"];
        [alert setMessage:@"Incorrect username and/or password."];
        
        [alert show];
        
        
    }
    
   
}

- (void)kumulosAPI:(Kumulos *)kumulos apiOperation:(KSAPIOperation *)operation carrierLogInDidCompleteWithResult:(NSArray *)theResults {
    
    

    
    if ([theResults count]) {
        

        
        [self performSegueWithIdentifier:@"logToCarrier" sender:self];
        
        
    }
    else {
        
        
        UIAlertView* alert = [[UIAlertView alloc]init];
        [alert addButtonWithTitle:@"OK"];
        [alert setDelegate:nil];
        
            if (_txtEmail.text.length > 0 && _txtPassword.text.length >0)
            {
                
                [alert setTitle:@"Carrier Account Not Found"];
                [alert setMessage:@"Incorrect username and/or password."];
                
                [alert show];

                
            }
            
            else if (_txtEmail.text.length== 0 && _txtPassword.text.length == 0){
                
                
                
                if (_btnLogIn.isSelected){
                
                    
                    [alert setTitle:@"Carrier Account Not Found"];
                    [alert setMessage:@"Incorrect username and/or password."];
                    [alert show];
                    

                    
                }
                
                
            }

    }

}


-(IBAction)userDoneEnteringText:(id)sender
{
    [sender resignFirstResponder];
    // do whatever you want with this text field
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
