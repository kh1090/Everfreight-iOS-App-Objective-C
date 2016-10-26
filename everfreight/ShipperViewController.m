//
//  ShipperViewController.m
//  everfreight
//
//  Created by Kyle Holsey on 7/8/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "ShipperViewController.h"
#import "SWRevealViewController.h"

@interface ShipperViewController (){
    CLLocationManager *locationManager;
    BOOL centerToUserLocation;
}

@end

@implementation ShipperViewController
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    centerToUserLocation = YES;
    
    _barButton.target = self.revealViewController;
    
    _barButton.action = @selector(revealToggle:);
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];

    self.navigationController.navigationBar.translucent = NO;
    
    _searchTenderBar.hidden=YES;
    
 
    
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    
    
    
    locationManager = [CLLocationManager new];
    
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        
        [locationManager requestWhenInUseAuthorization];
        
        
    }
    
    
    // Do any additional setup after loading the view.
      }
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    
}



- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
    static dispatch_once_t onceToken; dispatch_once(&onceToken, ^{ MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 40000, 60000);
        
        [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
        
});
    
    
    
}
- (IBAction)btnZoomPressed:(id)sender {
    
    
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 40000, 60000);
    
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    }


-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKAnnotationView *pinView = nil;
    
    if(annotation == mapView.userLocation)
    {
        static NSString *defaultPinID = @"com.invasivecode.pin";
        pinView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        
        if ( pinView == nil )
            pinView = [[MKAnnotationView alloc]
                       initWithAnnotation:annotation reuseIdentifier:defaultPinID];
        
        //pinView.pinColor = MKPinAnnotationColorGreen;
        pinView.canShowCallout = YES;
        //pinView.animatesDrop = YES;
        pinView.image = [UIImage imageNamed:@"package2@2x.png"];    //as suggested by Squatch
    }
    else {
        [mapView.userLocation setTitle:@"I am here"];
    }
    return pinView;
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    
    [self.searchTenderBar resignFirstResponder];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)ButtonClicked:(id)sender{
    
    if (_dropdownmenu.alpha == 0)
    {
        _dropdownmenu.hidden = false;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationDelay:0.001];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn ];
        
        [_dropdownmenu setBackgroundColor:[UIColor clearColor]];
        _dropdownmenu.alpha = 1;
        [UIView commitAnimations];

    }
    
    else {
        _dropdownmenu.hidden = true;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.001];
        [UIView setAnimationDelay:0.001];
       
        [_dropdownmenu setBackgroundColor:[UIColor clearColor]];
        _dropdownmenu.alpha = 0;
        [UIView commitAnimations];

        
        
        
        
        
    }
    
    
    
    
    
    
    
}



- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views {
    
    if (centerToUserLocation)
        
    {
        
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate, 2000000, 210000);
        
        
        [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
        
        
        centerToUserLocation = NO;
        
    }
    
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
