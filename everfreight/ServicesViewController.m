//
//  ServicesViewController.m
//  everfreight
//
//  Created by Kyle Holsey on 9/21/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "ServicesViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "RootViewController.h"



@interface ServicesViewController ()

@end

@implementation ServicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];
    
    self.navigationController.navigationBar.translucent = NO;

    
    _pageTitles = @[@"Connecting Shippers To Carriers", @"Optimizing Operations & Reducing Empty Miles", @"Helping Drivers Find Business"];
    
    _pageImages = @[@"everfreight-purplelogo-notext-38",@"everfreight-purplelogo-notext-38",@"everfreight-purplelogo-notext-38"];
    
    _pageBodies = @[@"We empower shippers with the latest technology in order to provide them with the best user experience possible.  Our services ease the shipment process for businesses both small and large.",@"Our mission is to improve operations for small, medium and large fleets by giving them access to our exclusive load network, thus keeping their trucks on the road and increasing revenue.",@"We understand that each driver operates at different hours of the day which is why we provide 24/7 support from our team of experts, along with program customization to fill the needs of each individual."];


    
}
-(void)viewDidAppear:(BOOL)animated {
    

    
    [UIView transitionWithView:self.lblLogisitcs
                      duration:2.0f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        
                        self.lblLogisitcs.text = rand() % 2 ? @"TECHNOLOGY" : @"TECHNOLOGY";
                        
                        
                    } completion:^(BOOL finished) {
                        
                        
                        [UIView transitionWithView:self.lblLogisitcs
                                          duration:2.0f
                                           options:UIViewAnimationOptionTransitionCrossDissolve
                                        animations:^{
                                            
                                            self.lblLogisitcs.text = rand() % 2 ? @"OPTIMIZED" : @"OPTIMIZED";
                                            

                            
                        } completion:nil];
                        
                        
                    }];
    

    
    [super viewDidAppear:animated];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Page View Controller Data Source
- (IBAction)btnLearnPressed:(id)sender {
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    

}





- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentController"];

    pageContentViewController.bodyTextString = self.pageBodies[index];
    pageContentViewController.titleTextString = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
