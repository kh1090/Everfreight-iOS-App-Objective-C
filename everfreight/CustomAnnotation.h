//
//  CustomAnnotation.h
//  everfreight
//
//  Created by Kyle Holsey on 9/22/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>

@interface CustomAnnotation : MKPlacemark

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *loadWeight;
@property (strong, nonatomic) NSString *equipType;
@property (strong, nonatomic) UILabel *loadWeightLabel;
@property (strong, nonatomic) UILabel *equipTypeLabel;

@end
