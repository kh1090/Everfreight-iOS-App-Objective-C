//
//  DriverViewController.m
//  everfreight
//
//  Created by Kyle Holsey on 7/10/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "DriverViewController.h"
#import "SWRevealViewController.h"
#import "Kumulos.h"
#import "MyAnnotation.h"
#import "CustomAnnotation.h"
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <QuartzCore/QuartzCore.h>


@interface DriverViewController (){
    
    CLLocationManager *locationManager;
    BOOL centerToUserLocation;
    NSMutableArray *mainArray;

}

@end

@implementation DriverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _routeView.hidden =true;
    
    _searchBar.hidden=true;
   
    centerToUserLocation =YES;
    
    
    
    [_scroller setScrollEnabled:YES];
    [_scroller setContentSize:CGSizeMake(375, 1250)];

    
    mainArray = [[NSMutableArray alloc]init];
    
    Kumulos* km = [[Kumulos alloc]init];
    
    [km setDelegate:self];
    
    [km getShipWithPickupAddress:@"pickupAddress" andDropoffAddress:@"dropoffAddress" andLoadWeight:@"loadWeight" andEquipmentType:@"equipmentType" ];
    

    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];
    
    self.navigationController.navigationBar.translucent = NO;
    
[self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Geeza Pro" size:16.0f]}];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    
      _mapView.delegate = self;
    [_mapView setShowsUserLocation:YES];
    
    locationManager = [CLLocationManager new];
    
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        
        [locationManager requestWhenInUseAuthorization];
   
    }
    
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    


    // Do any additional setup after loading the view.
}

- (void)kumulosAPI:(Kumulos *)kumulos apiOperation:(KSAPIOperation *)operation getShipDidCompleteWithResult:(NSArray *)theResults
{
    
    mainArray = [theResults copy];
    
}

- (IBAction)btnViewShipmentsPressed:(id)sender {
    
    
    
    NSString * result = [[mainArray valueForKey:@"pickupAddress"] componentsJoinedByString:@", "];
    
    NSArray *dropoffArray = [[NSArray alloc]init];
    NSArray *pickupArray = [[NSArray alloc]init];
    NSArray *weightArray = [[NSArray alloc]init];
    NSArray *equipArray = [[NSArray alloc]init];


    pickupArray = [mainArray valueForKey:@"pickupAddress"];
    
    dropoffArray = [mainArray valueForKey:@"dropoffAddress"];
    
    weightArray = [mainArray valueForKey:@"loadWeight"];
    
    equipArray = [mainArray valueForKey:@"equipmentType"];


    
    for(int i = 0; i < [mainArray count]; i++){
        
        NSString *pickupString = [pickupArray objectAtIndex:i];
        NSString *dropoffString = [dropoffArray objectAtIndex:i];
        NSString *weightString = [weightArray objectAtIndex:i];
        NSString *equipString = [equipArray objectAtIndex:i];

        
        MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
        request.naturalLanguageQuery = [pickupArray objectAtIndex:i];
        request.region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,120701, 120701);
        // 120701 meters is 75 miles
        MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:request];
        [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
            
            NSMutableArray *annotations = [NSMutableArray array];
            
            [response.mapItems enumerateObjectsUsingBlock:^(MKMapItem *item, NSUInteger idx, BOOL *stop) {
                CustomAnnotation *annotation = [[CustomAnnotation alloc] initWithPlacemark:item.placemark];
                
                annotation.title = [NSString stringWithFormat:@"Pick Up: %@", pickupString];
                
                
                annotation.subtitle = [NSString stringWithFormat:@"Drop Off: %@", dropoffString];
                
                annotation.phone = [NSString stringWithFormat:@"Load Weight: %@", weightString];
                
                annotation.equipType = [NSString stringWithFormat:@"Equipment Type: %@", equipString];
                
                [annotations addObject:annotation];
                
            }];
            
            [self.mapView addAnnotations:annotations];
            
            
        }];
        
        
    }
}







- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
    static dispatch_once_t onceToken; dispatch_once(&onceToken, ^{ MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 40000, 60000);
        
        [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
        

    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    
    [self.searchBar resignFirstResponder];
    
    
}
- (IBAction)btnZoomPressed:(id)sender {
    
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 40000, 60000);
    
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];

    
}


-(IBAction)ButtonClicked:(id)sender{
    
    if (_dropdownmenu.alpha == 0)
    {
        _dropdownmenu.hidden = false;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationDelay:0.001];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn ];
        
        [_dropdownmenu setBackgroundColor:[UIColor whiteColor]];
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
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if (![annotation isKindOfClass:[CustomAnnotation class]])
        return nil;
    
    MKAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                                       reuseIdentifier:@"CustomAnnotationView"];
    
    
    
    
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pack@2x.png"]];
    [annotationView addSubview:imageView];
    
    return annotationView;
    
    
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
    
    
    
    if (![view.annotation isKindOfClass:[CustomAnnotation class]])
        return;
    CustomAnnotation *annotation = (CustomAnnotation *)view.annotation;
    
    
    NSString* url = [NSString stringWithFormat:@"http://maps.apple.com/?saddr=%f,%f&daddr=%f,%f",self.mapView.userLocation.coordinate.latitude, self.mapView.userLocation.coordinate.longitude, annotation.coordinate.latitude, annotation.coordinate.longitude];
    
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Shipment Details"
                                 message:[NSString stringWithFormat:@" \n%@ \n%@ \n \n%@ \n%@", annotation.title, annotation.subtitle,annotation.phone, annotation.equipType]
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"Cancel"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle no, thanks button
                               }];
    

    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Begin Route"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                   
                                    
                                    
                                    
                                    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: url]];
                                    
                                    
                                    
 
                                    
                                    
                                }];
    
       [alert addAction:noButton];
    [alert addAction:yesButton];

    [self presentViewController:alert animated:YES completion:nil];
    alert.view.tintColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];                            }


- (void)unknownPersonViewController:(ABUnknownPersonViewController *)unknownPersonView didResolveToPerson:(ABRecordRef)person
{
    
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

