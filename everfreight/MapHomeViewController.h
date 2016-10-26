//
//  MapHomeViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 9/12/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/Mapkit.h>

@interface MapHomeViewController : UIViewController<MKMapViewDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *btnGasBack;
@property (weak, nonatomic) IBOutlet UIButton *btnGasFront;
@property (weak, nonatomic) IBOutlet UIButton *btnRestBack;
@property (weak, nonatomic) IBOutlet UIButton *btnRestFront;
@property (weak, nonatomic) IBOutlet UIButton *btnWalmartFront;
@property (weak, nonatomic) IBOutlet UIButton *btnWalmartBack;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;
@property (weak, nonatomic) IBOutlet UILabel *lblLine;



@end
