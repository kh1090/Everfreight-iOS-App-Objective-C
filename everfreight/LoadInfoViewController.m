//
//  LoadInfoViewController.m
//  everfreight
//
//  Created by Kyle Holsey on 7/10/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "LoadInfoViewController.h"
#import "NewShipmentViewController.h"
#import "ReviewViewController.h"

@interface LoadInfoViewController (){
    
    NSArray *equipmentArray;
    
    
}

@end

@implementation LoadInfoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataView.hidden=YES;
    
    
    
    
    
    UIPickerView  *yourpicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
    yourpicker.delegate = self;
    yourpicker.dataSource = self;
    yourpicker.showsSelectionIndicator = YES;
    self.txtEquipmentType.inputView = yourpicker;
    
    equipmentArray = @[@"Dry Van - 48'", @"Dry Van - 53'", @"Reefer Van - 48'", @"Reefer Van - 53'", @"Flatbed", @"Other"];
    

    
    // Do any additional setup after loading the view.
    
    self.lblPickupName.text = self.stringFromTextField;
    self.lblPickupAddress.text = self.pickupAddress;
      self.lblPickupDateTime.text = self.pickupDateTime;
      self.lblPickupRef1.text = self.pickupRef1;
      self.lblPickupRef2.text = self.pickupRef2;
      self.lblPickupNotes.text = self.pickupNotes;

    
      self.lblDropoffName.text = self.dropoffName;
      self.lblDropoffAddress.text = self.dropoffAddress;
      self.lblDropoffDateTime.text = self.dropoffDateTime;
      self.lblDropoffRef1.text = self.dropoffRef1;
      self.lblDropoffRef2.text = self.dropoffRef2;
      self.lblDropoffNotes.text = self.dropoffNotes;
    
    
    _txtLoadType.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _txtPieceCount.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _txtDimensions.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _txtWeight.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _txtValue.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
    _txtEquipmentType.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
     _txtAccessories.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);

    
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 1;
}
- (IBAction)buttonClicked:(id)sender {
    
    [_txtEquipmentType resignFirstResponder];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)dismissKeyboard:(id)sender
{
    [sender resignFirstResponder];
}


- (IBAction)btnNextPressed:(id)sender {
    
    ReviewViewController *VC2 = [self.storyboard instantiateViewControllerWithIdentifier:@"ReviewViewController"];
    
    VC2.pickupName = self.lblPickupName.text;
    VC2.pickupAddress = self.lblPickupAddress.text;
    VC2.pickupDateTime = self.lblPickupDateTime.text;
    VC2.pickupRef1 = self.lblPickupRef1.text;
    VC2.pickupRef2 = self.lblPickupRef1.text;
    VC2.pickupNotes = self.lblPickupNotes.text;
    
    VC2.dropoffName = self.lblDropoffName.text;
    VC2.dropoffAddress = self.lblDropoffAddress.text;
    VC2.dropoffDateTime = self.lblDropoffDateTime.text;
    VC2.dropoffRef1 = self.lblDropoffRef1.text;
    VC2.dropoffRef2  = self.lblDropoffRef2.text;
    VC2.dropoffNotes = self.lblDropoffNotes.text;
    
    VC2.equipmentType = self.txtEquipmentType.text;
    VC2.weight = self.txtWeight.text;
    VC2.pieceCount = self.txtPieceCount.text;
    VC2.productDescription = self.txtLoadType.text;
    VC2.dimensions  = self.txtDimensions.text;
    VC2.rate = self.txtValue.text;
    
    VC2.additionalInfo = self.txtAccessories.text;


    
    
    [self presentViewController:VC2 animated:YES completion:nil];
  
    
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
