//
//  RootViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 9/20/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"



@interface RootViewController : UIViewController<UIPageViewControllerDataSource>

- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageBodies;
@property (strong, nonatomic) NSArray *pageImages;


@end
