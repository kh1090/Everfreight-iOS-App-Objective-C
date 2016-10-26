//
//  ShipmentsViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 8/5/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>
#import "Kumulos.h"

@interface ShipmentsViewController : UIViewController<KumulosDelegate, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, MFMailComposeViewControllerDelegate>
{
    
    NSArray *mainArray;
    
    NSMutableArray     *results;
    BOOL isFiltered;
    
    
}

@property(nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSArray *results;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;



@property (nonatomic, strong) NSArray *searchResult;



@end
