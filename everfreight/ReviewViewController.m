//
//  ReviewViewController.m
//  everfreight
//
//  Created by Kyle Holsey on 7/11/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "ReviewViewController.h"

@interface ReviewViewController ()

@end

@implementation ReviewViewController{
    
    CLLocationManager *locationManager;

    
}

- (void)viewDidLoad {
    
   
    [super viewDidLoad];
    
    
   
    self.lblEquipmentType.text = self.equipmentType;
    self.lblWeight.text = self.weight;
    self.lblPieceCount.text = self.pieceCount;
    self.lblProductDescription.text = self.productDescription;
    self.lblDimensions.text = self.dimensions;
    self.lblRate.text = self.rate;
    
    self.lblPickNotes.text = self.pickupNotes;
    self.lblDropNotes.text = self.dropoffNotes;
    
    self.lblPickupName.text = self.pickupName;
    self.lblPickupZip.text = self.pickupZip;
    self.lblPickupRef1.text = self.pickupRef1;
    self.lblPickupRef2.text = self.pickupRef2;
    self.lblPickupDate.text = self.pickupDateTime;
    //FIX THIS ^^^^ SEPARATE DATE AND TIME
    
    //COMBINE ADDRESS, CITY, STATE, ZIP INTO 1 LABEL!!
    
    self.lblAddInfo.text = self.additionalInfo;
    
    
    self.lblPickupCity.text = self.pickupAddress;
    
    
    self.lblDropoffName.text = self.dropoffName;
    self.lblDropoffCity.text = self.dropoffAddress;
    self.lblDropoffZip.text = self.dropoffZip;
    self.lblDropoffDate.text = self.dropoffDateTime;
    self.lblDropoffRef1.text = self.dropoffRef1;
    self.lblDropoffRef2.text = self.dropoffRef2;
    
       _detailsView.hidden = TRUE;
    
    
    NSString *location = [(UILabel *)[[self view] viewWithTag:1]text];;
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:location
                 completionHandler:^(NSArray* placemarks, NSError* error){
                     if (placemarks && placemarks.count > 0) {
                         CLPlacemark *topResult = [placemarks objectAtIndex:0];
                         MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
                         
                         MKCoordinateRegion region = self.mapView.region;
                    
                         
                         [self.mapView setRegion:region animated:NO];
                         [self.mapView addAnnotation:placemark];
                     }
                 }
     ];
    
    NSString *location2 = [(UILabel *)[[self view] viewWithTag:6]text];;
    CLGeocoder *geocoder2 = [[CLGeocoder alloc] init];
    [geocoder2 geocodeAddressString:location2
                 completionHandler:^(NSArray* placemarks, NSError* error){
                     if (placemarks && placemarks.count > 0) {
                         CLPlacemark *topResult = [placemarks objectAtIndex:0];
                         MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
                         
                         MKCoordinateRegion region = self.mapView.region;
                         
                         [self.mapView setRegion:region animated:NO];
                         [self.mapView addAnnotation:placemark];
                         
                         
                     }
                 }
     ];


    
    
    
    
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(375, 1250)];
    
    
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    
    locationManager = [CLLocationManager new];
    
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        
        [locationManager requestWhenInUseAuthorization];
        
        
    }
    
    //:
    
    // Do any additional setup after loading the view.
}




    // Do any additional setup after loading the view.


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnDetailsPressed:(id)sender {
    
    _detailsView.hidden=FALSE;
    
}





- (IBAction)btnBackPressed:(id)sender {
    
    _detailsView.hidden=TRUE;
    
}

- (IBAction)btnPostTenderPressed:(id)sender {
    
    
    
    Kumulos* k = [[Kumulos alloc] init];

    
    [k setDelegate:self];
    
    [k uploadNewShipmentWithPickupCompany:_pickupName andPickupAddress:_pickupAddress andPickupDateTime:_pickupDateTime andPickupRef1:_pickupRef1 andPickupRef2:_pickupRef2 andPickupNotes:_pickupNotes andDropoffCompany:_dropoffName andDropoffAddress:_dropoffAddress andDropoffDateTime:_dropoffDateTime andDropoffRef1:_dropoffRef1 andDropoffRef2:_dropoffRef2 andDropoffNotes:_dropoffNotes andProductDescription:_productDescription andPieceCount:_pieceCount andLoadDimensions: _dimensions andLoadWeight:_weight andLoadValue:_rate andEquipmentType:_equipmentType andAdditionalInfo:_additionalInfo];
    

    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Shipment Tender Posted"
                                                    message:[NSString stringWithFormat:@"We have received your shipment details and will be contacting you shortly to confirm."]
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    
    
    
    [alert show];

  
    
    [self performSegueWithIdentifier:@"postToShip" sender:self];
    
    

    
}

    
    
    /*
    if ([MFMailComposeViewController canSendMail]) {
        
        NSArray *emailAddresses;
        emailAddresses = [[NSArray alloc]initWithObjects:@"operations@everfreight.co", nil];
        
        NSString* pickupAddress = [(UITextField*)[[self view] viewWithTag:1]text];
        
        NSString* pickupDateTime  = [(UITextField*)[[self view] viewWithTag:2]text];
        
        NSString* pickupName  = [(UITextField*)[[self view] viewWithTag:3]text];
        
        NSString* pickupRef1     = [(UITextField*)[[self view] viewWithTag:4]text];
        
        NSString* pickupRef2     = [(UITextField*)[[self view] viewWithTag:5]text];
        
        NSString* dropoffAddress     = [(UITextField*)[[self view] viewWithTag:6]text];
        
        NSString* dropoffDateTime = [(UITextField*)[[self view] viewWithTag:7]text];
        
        NSString* dropoffName  = [(UITextField*)[[self view] viewWithTag:8]text];
        
        NSString* dropoffRef1  = [(UITextField*)[[self view] viewWithTag:9]text];
        
        NSString* dropoffRef2     = [(UITextField*)[[self view] viewWithTag:10]text];
        
        NSString* equipmentType     = [(UITextField*)[[self view] viewWithTag:11]text];
        
        NSString* weight     = [(UITextField*)[[self view] viewWithTag:12]text];
        
        NSString* pieceCount     = [(UITextField*)[[self view] viewWithTag:13]text];
        
        NSString* productDescription = [(UITextField*)[[self view] viewWithTag:14]text];
        
        NSString* dimensions  = [(UITextField*)[[self view] viewWithTag:15]text];
        
        NSString* value  = [(UITextField*)[[self view] viewWithTag:16]text];
        
        NSString* additionalInfo     = [(UITextField*)[[self view] viewWithTag:17]text];
        
        NSString* pickupNotes     = [(UITextField*)[[self view] viewWithTag:18]text];
        
        NSString* dropoffNotes     = [(UITextField*)[[self view] viewWithTag:19]text];

     
        
            
            MFMailComposeViewController *emailDialog = [[MFMailComposeViewController alloc] init];
            
            [emailDialog setSubject:@"MOBILE APP - New Shipment Request"];
        
        
            [emailDialog setMessageBody:[NSString stringWithFormat: @"PICKUP DETAILS: \n Address: %@ \n Date & Time: %@ \n Customer Name: %@ \n Reference #1: %@ \n Reference #2: %@ \n \n DROPOFF DETAILS: \n Address: %@ \n Date & Time: %@ \n Customer Name: %@ \n Reference #1: %@ \n Reference #2: %@ \n \n LOAD INFO: \n Equipment Type: %@ \n Weight: %@ \n Piece Count: %@ \n Product Description: %@ \n Dimensions: %@ \n Value: %@ \n Additional Info: %@ \n Pickup Notes: %@ \n Dropoff Notes: %@ \n",pickupAddress, pickupDateTime, pickupName, pickupRef1, pickupRef2, dropoffAddress, dropoffDateTime, dropoffName, dropoffRef1, dropoffRef2, equipmentType, weight, pieceCount, productDescription, dimensions, value, additionalInfo, pickupNotes, dropoffNotes]isHTML:NO];
            
            [emailDialog setToRecipients:emailAddresses];
            
            emailDialog.mailComposeDelegate = self;
            
            [self presentModalViewController:emailDialog animated:YES];
            
            
        }
        
    
        else {
            
            UIAlertView *alert4 = [[UIAlertView alloc] initWithTitle:@"Email Not Found"
                                                             message:[NSString stringWithFormat:@"To complete your shipment request, please enable email in your device's settings.  This can be done by going to Settings > Mail > Accounts."]
                                                            delegate:self
                                                   cancelButtonTitle:nil
                                                   otherButtonTitles:@"OK", nil];
            
            [alert4 show];
            
            
            
            
        }
        
        
    }
*/

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
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Shipment Tender Posted"
                                                            message:[NSString stringWithFormat:@"We have received your shipment details and will be contacting you shortly to confirm."]
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
    
    [k uploadNewShipmentWithPickupCompany:_pickupName andPickupAddress:_pickupAddress andPickupDateTime:_pickupDateTime andPickupRef1:_pickupRef1 andPickupRef2:_pickupRef2 andPickupNotes:_pickupNotes andDropoffCompany:_dropoffName andDropoffAddress:_dropoffAddress andDropoffDateTime:_dropoffDateTime andDropoffRef1:_dropoffRef1 andDropoffRef2:_dropoffRef2 andDropoffNotes:_dropoffNotes andProductDescription:_productDescription andPieceCount:_pieceCount andLoadDimensions: _dimensions andLoadWeight:_weight andLoadValue:_rate andEquipmentType:_equipmentType andAdditionalInfo:_additionalInfo];
    
    
    [[controller presentingViewController] dismissViewControllerAnimated:YES completion:^{
        
        if (result == MFMailComposeResultSent)
        {
          
            [self performSegueWithIdentifier:@"postToShip" sender:self];
            
        }
        
        [self performSegueWithIdentifier:@"postToShip" sender:self];
        

        
    }];
    
    [self performSegueWithIdentifier:@"postToShip" sender:self];
    

    
    
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
