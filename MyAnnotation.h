//
//  MyAnnotation.h
//  everfreight
//
//  Created by Kyle Holsey on 10/1/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject<MKAnnotation>
{
    
    CLLocationCoordinate2D  coordinate;
    NSString*               title;
    NSString*               subtitle;
    
}

@property (nonatomic, assign)CLLocationCoordinate2D coordinate;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *subtitle;

@end
