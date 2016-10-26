//
//  NewShipmentViewController.m
//  everfreight
//
//  Created by Kyle Holsey on 7/8/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "NewShipmentViewController.h"
#import "LoadInfoViewController.h"

@interface NewShipmentViewController ()<UITextFieldDelegate>

@end

@implementation NewShipmentViewController
@synthesize txtAddress;

- (void)viewDidLoad {
    
    
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [_txtDateTime setInputView:datePicker];
    
    
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    [datePicker2 setDate:[NSDate date]];
    datePicker2.datePickerMode = UIDatePickerModeDateAndTime;
    [datePicker2 addTarget:self action:@selector(dateTextField2:) forControlEvents:UIControlEventValueChanged];
    [_txtDropDateTime setInputView:datePicker2];
    
    
    
 
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
 

    
    
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(375, 1250)];
   
    self.txtDateTime.text = @"";
    self.txtDateTime.placeholder = @"Date & Time";
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    
    
    
    _txtName.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
     txtAddress.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
     _txtDateTime.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
     _txtRef1.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
     _txtRef2.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _fieldPickupNotes.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    
    
    
     _txtDropName.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
     _txtDropAddress.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
     _txtDropDateTime.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    
     _txtDropRef1.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    
     _txtDropRef2.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    
     _fieldDropoffNotes.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    
    
    
}



-(void) dateTextField:(id)sender



{
    UIDatePicker *picker = (UIDatePicker*)_txtDateTime.inputView;
      NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"MM-dd-yyyy hh:mm"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    _txtDateTime.text = [NSString stringWithFormat:@"%@",dateString];
    
}
-(void) dateTextField2:(id)sender



{
    
    UIDatePicker *picker = (UIDatePicker*)_txtDropDateTime.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"MM-dd-yyyy hh:mm"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    _txtDropDateTime.text = [NSString stringWithFormat:@"%@",dateString];
    
    
}




-(IBAction)dismissKeyboard:(id)sender
{
    [sender resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnNextClicked:(id)sender {
    
    LoadInfoViewController *VC2 = [self.storyboard instantiateViewControllerWithIdentifier:@"LoadInfoViewController"];
    
    VC2.stringFromTextField = self.txtName.text;
     VC2.pickupAddress = self.txtAddress.text;
     VC2.pickupDateTime = self.txtDateTime.text;
     VC2.pickupRef1 = self.txtRef1.text;
     VC2.pickupRef2 = self.txtRef2.text;
     VC2.pickupNotes = self.fieldPickupNotes.text;
    
     VC2.dropoffName = self.txtDropName.text;
     VC2.dropoffAddress = self.txtDropAddress.text;
     VC2.dropoffDateTime = self.txtDropDateTime.text;
     VC2.dropoffRef1 = self.txtDropRef1.text;
     VC2.dropoffRef2  = self.txtDropRef2.text;
     VC2.dropoffNotes = self.fieldDropoffNotes.text;
    
    
    [self presentViewController:VC2 animated:YES completion:nil];
    
    
}
- (IBAction)txtDateTimePressed:(id)sender {


}

- (void)textFieldDidBeginEditing:(UITextField *)textField;{
    
    if (textField.tag == 3 )
        
    {
        
      
        
    }
    
}


-(IBAction)button{
    
    
    
  
    [_txtDateTime resignFirstResponder];
    [_txtDropDateTime resignFirstResponder];
    
    
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
