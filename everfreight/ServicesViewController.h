//
//  ServicesViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 9/21/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PageContentViewController.h"

@interface ServicesViewController : UIViewController<UIPageViewControllerDataSource, UIPageViewControllerDelegate>


- (IBAction)startWalkthrough:(id)sender;

@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageBodies;
@property (strong, nonatomic) NSArray *pageImages;

@property (weak, nonatomic) IBOutlet UILabel *lblLogisitcs;
@property (weak, nonatomic) IBOutlet UILabel *lblSHip;
@property (weak, nonatomic) IBOutlet UIButton *btnLearnMore;

@end
