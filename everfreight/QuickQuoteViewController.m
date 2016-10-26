//
//  QuickQuoteViewController.m
//  everfreight
//
//  Created by Kyle Holsey on 7/11/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "QuickQuoteViewController.h"
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>

@interface QuickQuoteViewController (){
    
    NSArray *equipmentArray;
    
}

@end

@implementation QuickQuoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIPickerView  *yourpicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
    yourpicker.delegate = self;
    yourpicker.dataSource = self;
    yourpicker.showsSelectionIndicator = YES;
    self.txtEquipmentType.inputView = yourpicker;
    
    equipmentArray = @[@"Dry Van - 48'", @"Dry Van - 53'", @"Reefer Van - 48'", @"Reefer Van - 53'", @"Flatbed", @"Other"];
    
    
    
    

        
    
    // Do any additional setup after loading the view.

    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];
    
    self.navigationController.navigationBar.translucent = NO;
    

    
    
    
    _txtPickupZip.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _txtDropoffZip.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _txtPieceCount.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _txtWeight.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _txtEquipmentType.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _txtAccessories.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    


}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component


{
    return [equipmentArray count];
    
}

-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component


{
    return [equipmentArray objectAtIndex:row];
    
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    _txtEquipmentType.text = equipmentArray[row];
    
    
}
- (IBAction)buttonClicked:(id)sender {
    
    [_txtEquipmentType resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)dismissKeyboard:(id)sender
{
    [sender resignFirstResponder];
}
- (IBAction)btnGetQuotePressed:(id)sender {
    
   
    
    /* if ([MFMailComposeViewController canSendMail]) {
        
        NSArray *emailAddresses;
        emailAddresses = [[NSArray alloc]initWithObjects:@"operations@everfreight.co", nil];
     
     */
        
        NSString* pickupZip  = [(UITextField*)[[self view] viewWithTag:1]text];
        
        NSString* dropoffZip  = [(UITextField*)[[self view] viewWithTag:2]text];
        
        NSString* pieceCount  = [(UITextField*)[[self view] viewWithTag:3]text];
        
        NSString* loadWeight     = [(UITextField*)[[self view] viewWithTag:4]text];
        
        NSString* equipmentType     = [(UITextField*)[[self view] viewWithTag:5]text];
        
        NSString* phoneNumber     = [(UITextField*)[[self view] viewWithTag:6]text];
        
    
    
    
        if (pickupZip.length>0 && dropoffZip.length > 0
            && pieceCount.length > 0 && loadWeight.length >0 && equipmentType.length > 0 && phoneNumber.length > 0 )
            
        {
            
            
            
            Kumulos* k = [[Kumulos alloc] init];
            
            [k setDelegate:self];
            
            
            NSString *pickupZipDB;
            pickupZipDB = _txtPickupZip.text;
            
            NSString *dropoffZipDB;
            dropoffZipDB = _txtDropoffZip.text;
            
            NSString *pieceCountDB;
            pieceCountDB = _txtPieceCount.text;
            
            
            [k uploadQuickQuoteWithEquipmentType:_txtEquipmentType.text andContactNumber:_txtAccessories.text andTotalWeight:_txtWeight.text andPickupZip:pickupZipDB andDropoffZip:dropoffZipDB andPieceCount:pieceCountDB];
            
        
            [self performSegueWithIdentifier:@"quickToHome" sender:self];
                
                

            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Quote Request Received"
                                                            message:[NSString stringWithFormat:@"Thank you for your quote request.  We have received your details and will be contacting you shortly to confirm your quote."]
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            
            
            
            [alert show];

        
        
        
        }
        
  
     
     
        else
    
    
    if (pickupZip.length == 0 || dropoffZip.length == 0 || pieceCount.length == 0 || loadWeight.length == 0 || equipmentType.length == 0 || phoneNumber.length ==0)
            
        {
            UIAlertView *alert3 = [[UIAlertView alloc] initWithTitle:@"Missing Info"
                                                             message:[NSString stringWithFormat:@"One or more fields are missing."]
                                                            delegate:self
                                                   cancelButtonTitle:nil
                                                   otherButtonTitles:@"OK", nil];
            
            [alert3 show];
            
            
        }
 
       /* else {
            
            UIAlertView *alert4 = [[UIAlertView alloc] initWithTitle:@"Email Not Found"
                                                             message:[NSString stringWithFormat:@"To complete your quote request, please enable email in your device's settings.  This can be done by going to Settings > Mail > Accounts."]
                                                            delegate:self
                                                   cancelButtonTitle:nil
                                                   otherButtonTitles:@"OK", nil];
            
            [alert4 show];
            
            
            
            
        }
        
        
    }
        */
}


/*- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancelled"
                                                            message:[NSString stringWithFormat:@"You have cancelled this email."]
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
    

           
            [alert show];
            
        }
            break;
            
        case MFMailComposeResultSaved:
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Draft Saved"
                                                            message:[NSString stringWithFormat:@"You have saved a draft of this email."]
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            
            
            
            [alert show];
            
            
        }
            break;
            
        case MFMailComposeResultSent:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Quote Request Received"
                                                            message:[NSString stringWithFormat:@"Thank you for your quote request.  We have received your details and will be contacting you shortly to confirm your quote."]
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            
            
            
            [alert show];
        }
            break;
            
        case MFMailComposeResultFailed:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message Failed"
                                                            message:[NSString stringWithFormat:@"Email failed to send."]
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            
            
            
            [alert show];
        }
            break;
            
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    
    
    
    Kumulos* k = [[Kumulos alloc] init];
    
    [k setDelegate:self];
    
    
    NSString *pickupZipDB;
    pickupZipDB = _txtPickupZip.text;
    
    NSString *dropoffZipDB;
    dropoffZipDB = _txtDropoffZip.text;
    
    NSString *pieceCountDB;
    pieceCountDB = _txtPieceCount.text;
    

    [k uploadQuickQuoteWithEquipmentType:_txtEquipmentType.text andContactNumber:_txtAccessories.text andTotalWeight:_txtWeight.text andPickupZip:pickupZipDB andDropoffZip:dropoffZipDB andPieceCount:pieceCountDB];
         
    [[controller presentingViewController] dismissViewControllerAnimated:YES completion:^{
        
        if (result == MFMailComposeResultSent)
        {
            [self dismissViewControllerAnimated:YES completion:nil];
 
        }
        [self performSegueWithIdentifier:@"quickToHome" sender:self];
        

        
          }];
    
    [self performSegueWithIdentifier:@"quickToHome" sender:self];
    

    
}
*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
