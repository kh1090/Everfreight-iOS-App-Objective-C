//
//  ShipperViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 7/8/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface ShipperViewController : UIViewController<MKMapViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UISearchBar *searchTenderBar;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak, nonatomic) IBOutlet UIView *dropdownmenu;

-(IBAction)ButtonClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnZoom;

@end
