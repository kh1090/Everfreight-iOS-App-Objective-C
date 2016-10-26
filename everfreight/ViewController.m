//
//  ViewController.m
//  everfreight
//
//  Created by Kyle Holsey on 7/5/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SWRevealViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0]};
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    _btnDriver.layer.cornerRadius = 4;
    _btnDriver.clipsToBounds = YES;
    
    _btnCarrier.layer.cornerRadius = 4;
    _btnCarrier.clipsToBounds = YES;

    _btnShipper.layer.cornerRadius = 4;
    _btnShipper.clipsToBounds = YES;
    
    
    
    [[_btnDriver layer] setBorderWidth:1.0f];
    [[_btnDriver layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    
    [[_btnShipper layer] setBorderWidth:1.0f];
    [[_btnShipper layer] setBorderColor:[UIColor whiteColor].CGColor];

    
    [[_btnCarrier layer] setBorderWidth:1.0f];
    [[_btnCarrier layer] setBorderColor:[UIColor whiteColor].CGColor];

   
    
}
- (IBAction)btnShipperPressed:(id)sender {
   }
- (IBAction)btnDriverPressed:(id)sender {
    
   
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end 
