//
//  MapHomeViewController.m
//  everfreight
//
//  Created by Kyle Holsey on 9/12/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "MapHomeViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SWRevealViewController.h"
#import "CustomAnnotation.h"
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface MapHomeViewController ()
{
    
    CLLocationManager *locationManager;
    BOOL centerToUserLocation;
    
    int btnGasIndex;
    int btnCoffeeIndex;
    int btnWalmartIndex;
    

}

@end

@implementation MapHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[_infoView layer] setBorderWidth:0.5f];
    [[_infoView layer] setBorderColor:[UIColor lightGrayColor].CGColor];

    
    btnGasIndex = 0;
    btnWalmartIndex=0;
    btnCoffeeIndex=0;
    
    
    
    _infoView.hidden = YES;
    _lblLine.hidden=YES;
    
    
    [[_btnClose layer] setBorderWidth:0.5f];
    [[_btnClose layer] setBorderColor:[UIColor blackColor].CGColor];

    
    [[_btnGasBack layer] setBorderWidth:1.0f];
    [[_btnGasBack layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    
    [[_btnRestBack layer] setBorderWidth:1.0f];
    [[_btnRestBack layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    
    [[_btnWalmartBack layer] setBorderWidth:1.0f];
    [[_btnWalmartBack layer] setBorderColor:[UIColor whiteColor].CGColor];
    

    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.barButton setTarget: self.revealViewController];
        [self.barButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

    
        
    centerToUserLocation =YES;
    
    _btnWalmartBack.layer.cornerRadius = 2;
    _btnWalmartBack.clipsToBounds=YES;
    
    _btnRestBack.layer.cornerRadius = 2;
    _btnRestBack.clipsToBounds=YES;
    
    _btnGasBack.layer.cornerRadius = 2;
    _btnGasBack.clipsToBounds=YES;
    
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];
    
    self.navigationController.navigationBar.translucent = NO;

    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    
    //Instantiate a location object.
    locationManager = [[CLLocationManager alloc] init];
    
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        
        [locationManager requestWhenInUseAuthorization];
        
    }
    
    
    //Make this controller the delegate for the location manager.
    
    locationManager.delegate = self;
    
    //Set some parameters for the location object.
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    
}

- (IBAction)btnInfoPressed:(id)sender {
    
    
    _infoView.hidden = NO;
    _lblLine.hidden = NO;
    
    
}







- (IBAction)btnClosePressed:(id)sender {
    
    
    _infoView.hidden = YES;
    _lblLine.hidden = YES;
    
}


- (IBAction)btnCoffeePressed:(id)sender {
    
    
    if (btnCoffeeIndex==0){
        
        btnCoffeeIndex = 1;
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"coffee shop, starbucks, coffee bean";
    request.region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,120701, 120701);
    // 120701 meters is 75 miles
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        NSMutableArray *annotations = [NSMutableArray array];
        
        [response.mapItems enumerateObjectsUsingBlock:^(MKMapItem *item, NSUInteger idx, BOOL *stop) {
            CustomAnnotation *annotation = [[CustomAnnotation alloc] initWithPlacemark:item.placemark];
            
            annotation.title = item.name;
            annotation.subtitle = item.placemark.addressDictionary[(NSString *)kABPersonAddressStreetKey];
            annotation.phone = item.phoneNumber;
            
            [annotations addObject:annotation];
            
        }];
        
        [self.mapView addAnnotations:annotations];
    }];
    
    }
        else if (btnCoffeeIndex ==1)
        {
            
            [self.mapView removeAnnotations:self.mapView.annotations];
            btnCoffeeIndex = 0;
            
        }
        

    
    
}
- (IBAction)btnWalmartPressed:(id)sender {
    
    if(btnWalmartIndex == 0)
    {
        btnWalmartIndex = 1;
        
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"walmart";
    request.region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,120701, 120701);
    // 120701 meters is 75 miles
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        NSMutableArray *annotations = [NSMutableArray array];
        
        [response.mapItems enumerateObjectsUsingBlock:^(MKMapItem *item, NSUInteger idx, BOOL *stop) {
            CustomAnnotation *annotation = [[CustomAnnotation alloc] initWithPlacemark:item.placemark];
            
            annotation.title = item.name;
            annotation.subtitle = item.placemark.addressDictionary[(NSString *)kABPersonAddressStreetKey];
            annotation.phone = item.phoneNumber;
            
            [annotations addObject:annotation];
            
        }];
        
        [self.mapView addAnnotations:annotations];
    }];
    
}
    
    else if (btnWalmartIndex ==1)
    {
        
        [self.mapView removeAnnotations:self.mapView.annotations];
        btnWalmartIndex= 0;
        
    }
    

    
}



- (IBAction)btnGasPressed:(id)sender {
    
    if (btnGasIndex == 0)
    {
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"fuel";
    request.region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,120701, 120701);
    // 120701 meters is 75 miles
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        NSMutableArray *annotations = [NSMutableArray array];
        
        [response.mapItems enumerateObjectsUsingBlock:^(MKMapItem *item, NSUInteger idx, BOOL *stop) {
            CustomAnnotation *annotation = [[CustomAnnotation alloc] initWithPlacemark:item.placemark];
            
            annotation.title = item.name;
            annotation.subtitle = item.placemark.addressDictionary[(NSString *)kABPersonAddressStreetKey];
            annotation.phone = item.phoneNumber;
            
            [annotations addObject:annotation];
            
        }];
        
        [self.mapView addAnnotations:annotations];
        
        btnGasIndex = 1;
        
    }];
        
    }
    
    else if (btnGasIndex ==1)
    {
        
        [self.mapView removeAnnotations:self.mapView.annotations];
        btnGasIndex = 0;
        
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
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    if (![view.annotation isKindOfClass:[CustomAnnotation class]])
        return;
    CustomAnnotation *annotation = (CustomAnnotation *)view.annotation;
    
    ABRecordRef person = ABPersonCreate();
    ABRecordSetValue(person, kABPersonOrganizationProperty, (__bridge CFStringRef) annotation.title, NULL);
    
    if (annotation.phone)
    {
        ABMutableMultiValueRef phoneNumberMultiValue = ABMultiValueCreateMutable(kABMultiStringPropertyType);
        ABMultiValueAddValueAndLabel(phoneNumberMultiValue, (__bridge CFStringRef) annotation.phone, kABPersonPhoneMainLabel, NULL);
        ABRecordSetValue(person, kABPersonPhoneProperty, phoneNumberMultiValue, nil);
        CFRelease(phoneNumberMultiValue);
    }
    
    ABMutableMultiValueRef address = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
    ABMultiValueAddValueAndLabel(address, (__bridge CFDictionaryRef) annotation.addressDictionary, kABWorkLabel, NULL);
    ABRecordSetValue(person, kABPersonAddressProperty, address, NULL);
    
    
    ABUnknownPersonViewController *personView = [[ABUnknownPersonViewController alloc] init];
    
    personView.unknownPersonViewDelegate = self;
    personView.displayedPerson = person;
    personView.allowsAddingToAddressBook = YES;

    
    [self.navigationController pushViewController:personView animated:YES];
    
    CFRelease(address);
    CFRelease(person);
}

- (void)unknownPersonViewController:(ABUnknownPersonViewController *)unknownPersonView didResolveToPerson:(ABRecordRef)person
{
    
}

#pragma mark - MKMapViewDelegate methods.
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views {
    
    if (centerToUserLocation)
        
    {
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate, 5000, 6000);
        
        [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
        
        
        centerToUserLocation = NO;
        
    }
}


- (IBAction)btnZoomPressed:(id)sender {
    
    
    MKCoordinateRegion region;
    region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,5000,6000);
    
    
    [_mapView setRegion:region animated:YES];
    
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
