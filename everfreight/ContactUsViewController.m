//
//  ContactUsViewController.m
//  everfreight
//
//  Created by Kyle Holsey on 9/24/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _webView.hidden = TRUE;
    
    [_scroller setScrollEnabled:YES];
    [_scroller setContentSize:CGSizeMake(375, 1250)];
    
    
    _btnSend.layer.cornerRadius = 1;
    _btnSend.clipsToBounds=YES;

    UIColor *color = [UIColor darkGrayColor];
    
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"Subject" attributes:@{ NSForegroundColorAttributeName:color, NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:14.0] }];
    self.txtEmail.attributedPlaceholder = str;
    
    
    
    NSAttributedString *str2 = [[NSAttributedString alloc] initWithString:@"Full Name" attributes:@{ NSForegroundColorAttributeName:color, NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:14.0] }];
    self.txtFirstName.attributedPlaceholder = str2;
    
    NSAttributedString *str3 = [[NSAttributedString alloc] initWithString:@"Company Name" attributes:@{ NSForegroundColorAttributeName:color, NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:14.0] }];
    self.txtLastName.attributedPlaceholder = str3;
    
    NSAttributedString *str7 = [[NSAttributedString alloc] initWithString:@"Contact #" attributes:@{ NSForegroundColorAttributeName:color, NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:14.0] }];
    self.txtContactNumber.attributedPlaceholder = str7;
    
    
    _txtEmail.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _txtFirstName.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _txtLastName.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _txtContactNumber.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
       
       self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];
    
    self.navigationController.navigationBar.translucent = NO;

    
    
    
    
}
- (IBAction)btnFacebookPressed:(id)sender {
    
    _webView.hidden = FALSE;
    
    NSString *urlString = @"https://www.facebook.com/everfreightinc/";
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlString];
    
    //URL Request Object
    NSURLRequest *webRequest = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [_webView loadRequest:webRequest];
    
}

- (IBAction)btnBackPressed:(id)sender {
    
    
    if (_webView.hidden == FALSE)
    {
        
        self.webView.hidden = TRUE;
        
        
    }
    
    else if (_webView.hidden == TRUE) {
        
        [self performSegueWithIdentifier:@"toMap" sender:self];
        
    }
    
    
    
}
- (IBAction)btnWebsitePressed:(id)sender {
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://everfreight.co"]];
    
    
}




- (IBAction)btnInstaPressed:(id)sender {
    
    
    _webView.hidden = FALSE;
    
    NSString *urlString = @"https://www.instagram.com/everfreight/";
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlString];
    
    //URL Request Object
    NSURLRequest *webRequest = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [_webView loadRequest:webRequest];
    
    
}
- (IBAction)btnTwitterPressed:(id)sender {
    
    
    _webView.hidden = FALSE;
    
    NSString *urlString = @"https://twitter.com/everfreight";
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlString];
    
    //URL Request Object
    NSURLRequest *webRequest = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [_webView loadRequest:webRequest];
 
}

- (IBAction)btnSendPressed:(id)sender {
    
    if (_txtFirstName.text.length == 0 || _txtLastName.text.length == 0 || _txtContactNumber.text.length == 0 || _txtEmail.text.length == 0 || _txtMessage.text.length == 0)
        
    {
        UIAlertView *alert3 = [[UIAlertView alloc] initWithTitle:@"Missing Info"
                                                         message:[NSString stringWithFormat:@"One or more fields are missing."]
                                                        delegate:self
                                               cancelButtonTitle:nil
                                               otherButtonTitles:@"OK", nil];
        
        [alert3 show];
        
        
    }


    else {
    
    
    
    if ([MFMailComposeViewController canSendMail]) {
        
        
        NSArray *emailAddresses;
        emailAddresses = [[NSArray alloc]initWithObjects:@"support@everfreight.co", nil];
        
        
        MFMailComposeViewController *emailDialog = [[MFMailComposeViewController alloc] init];
        
        [emailDialog setSubject:@"MOBILE APP - New Inquiry"];
        
        [emailDialog setMessageBody:[NSString stringWithFormat: @"New Inquiry From: \n \n %@ \n Company Name: %@ \n Contact #: %@ \n \n Subject: %@ \n%@\n", _txtFirstName.text, _txtLastName.text, _txtContactNumber.text, _txtEmail.text, _txtMessage.text]isHTML:NO];
        
        [emailDialog setToRecipients:emailAddresses];
        
        emailDialog.mailComposeDelegate = self;
        
        [self presentModalViewController:emailDialog animated:YES];
        
    }
    else {
        
        UIAlertView *alert4 = [[UIAlertView alloc] initWithTitle:@"Email Not Found"
                                                         message:[NSString stringWithFormat:@"To complete your inquiry request, please enable email in your device's settings.  This can be done by going to Settings > Mail > Accounts."]
                                                        delegate:self
                                               cancelButtonTitle:nil
                                               otherButtonTitles:@"OK", nil];
        
        [alert4 show];
        
        
        
        
    }
    
}
}

-(IBAction)dismissKeyboard:(id)sender
{
    [sender resignFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [_txtMessage resignFirstResponder];
        return NO;
    }
    
    return YES;
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    
    
    
    switch (result) {
            
        case MFMailComposeResultSent:{
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Inquiry Received"
                                                            message:[NSString stringWithFormat:@"Thank you for reaching out to us! We have received your information and will contact you shortly."]
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            
            
            
            [alert show];
            
            [self dismissModalViewControllerAnimated:YES];
            
            
            
        }
            
            
            
            
            
            break;
            
        case MFMailComposeResultSaved:{
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Draft Saved"
                                                            message:[NSString stringWithFormat:@"You have saved a draft of this email."]
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            
            
            [alert show];
            
            [self dismissModalViewControllerAnimated:YES];
            
        }
            
            
            break;
        case MFMailComposeResultCancelled:{
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancelled"
                                                            message:[NSString stringWithFormat:@"You have cancelled this email."]
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            [alert show];
            [self dismissModalViewControllerAnimated:YES];
            
            
            
        }
            [self performSegueWithIdentifier:@"toMap" sender:self];
            
            
            
    }
    [self performSegueWithIdentifier:@"toMap" sender:self];
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
