//
//  CarrierViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 7/9/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Kumulos.h"
#import "MyAnnotation.h"

@interface CarrierViewController : UIViewController<MKMapViewDelegate, KumulosDelegate>
{
    
    MyAnnotation* myAnnotation;
    NSMutableArray *annotations;
    
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIView *dropdownmenu;

-(IBAction)ButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnZoom;


@end
