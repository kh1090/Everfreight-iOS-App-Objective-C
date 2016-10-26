//
//  DriverViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 7/10/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Kumulos.h"


@interface DriverViewController : UIViewController<MKMapViewDelegate, UISearchBarDelegate, MKAnnotation, KumulosDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak, nonatomic) IBOutlet UIView *dropdownmenu;
@property (weak, nonatomic) IBOutlet UIButton *searchBar;
@property (weak, nonatomic) IBOutlet UIView *routeView;
@property (weak, nonatomic) IBOutlet UIScrollView *scroller;
@property (weak, nonatomic) IBOutlet UIButton *btnBeginRoute;
@property (weak, nonatomic) IBOutlet UILabel *lblPickup;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoff;

@property (weak, nonatomic) IBOutlet UIView *shipView;

-(IBAction)ButtonClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnZoom;

@end
