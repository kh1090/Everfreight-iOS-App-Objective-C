//
//  ReviewViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 7/11/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MessageUI/MessageUI.h>
#include "Kumulos.h"



@interface ReviewViewController : UIViewController<MKMapViewDelegate, MFMailComposeViewControllerDelegate, KumulosDelegate, UINavigationBarDelegate>
{
    IBOutlet UIScrollView *scroller;
    
}
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationController;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;


@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIView *detailsView;
@property (weak, nonatomic) IBOutlet UIButton *btnDetails;

@property (weak, nonatomic) IBOutlet UIButton *btnBack;



@property (nonatomic, retain) MKPolyline *routeLine; //your line
@property (nonatomic, retain) MKPolylineView *routeLineView; //overlay view



@property (weak, nonatomic) IBOutlet UILabel *lblPickupCity;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffCity;
@property (weak, nonatomic) IBOutlet UILabel *lblPickupZip;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffZip;
@property (weak, nonatomic) IBOutlet UILabel *lblPickupDate;
@property (weak, nonatomic) IBOutlet UILabel *lblPickupTime;
@property (weak, nonatomic) IBOutlet UILabel *lblPickupRef2;
@property (weak, nonatomic) IBOutlet UILabel *lblPickupRef1;
@property (weak, nonatomic) IBOutlet UILabel *lblPickupNotes;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffDate;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffTime;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffRef1;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffNotes;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffRef2;
@property (weak, nonatomic) IBOutlet UILabel *lblPickupName;


@property (weak, nonatomic) IBOutlet UILabel *lblEquipmentType;
@property (weak, nonatomic) IBOutlet UILabel *lblWeight;
@property (weak, nonatomic) IBOutlet UILabel *lblPieceCount;
@property (weak, nonatomic) IBOutlet UILabel *lblProductDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblDimensions;
@property (weak, nonatomic) IBOutlet UILabel *lblRate;
@property (weak, nonatomic) IBOutlet UITextView *lblPickNotes;
@property (weak, nonatomic) IBOutlet UITextView *lblDropNotes;
@property (weak, nonatomic) IBOutlet UILabel *lblDropoffName;


@property (strong, nonatomic)  NSString *pickupName;

@property (strong, nonatomic)  NSString *dropoffName;


@property (strong, nonatomic)  NSString *pickupZip;

@property (strong, nonatomic)  NSString *pickupAddress;

@property (strong, nonatomic)  NSString *pickupDateTime;

@property (strong, nonatomic)  NSString *pickupRef1;

@property (strong, nonatomic)  NSString *pickupRef2;

@property (strong, nonatomic)  NSString *dropoffAddress;

@property (strong, nonatomic)  NSString *dropoffZip;

@property (strong, nonatomic)  NSString *dropoffDateTime;

@property (strong, nonatomic)  NSString *dropoffRef1;

@property (strong, nonatomic)  NSString *dropoffRef2;

@property (strong, nonatomic)  NSString *dropoffNotes;

@property (strong, nonatomic)  NSString *pickupNotes;


@property (strong, nonatomic)  NSString *equipmentType;
@property (strong, nonatomic)  NSString *weight;

@property (strong, nonatomic)  NSString *pieceCount;

@property (strong, nonatomic)  NSString *productDescription;

@property (strong, nonatomic)  NSString *dimensions;

@property (strong, nonatomic)  NSString *rate;

@property (weak, nonatomic) IBOutlet UILabel *lblAddInfo;


@property (strong, nonatomic)  NSString *additionalInfo;







@end
