//
//  MyAnnotation.m
//  everfreight
//
//  Created by Kyle Holsey on 10/1/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation
@synthesize title;
@synthesize subtitle;
@synthesize coordinate;

- (void)dealloc
{
    self.title = nil;
    self.subtitle = nil;
}

@end
