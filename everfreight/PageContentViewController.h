//
//  PageContentViewController.h
//  everfreight
//
//  Created by Kyle Holsey on 9/20/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController{
    
    
}
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UITextView *bodyText;
@property (weak, nonatomic) IBOutlet UILabel *titleText;


@property NSUInteger pageIndex;
@property NSString *titleTextString;
@property NSString *bodyTextString;
@property NSString *imageFile;

@end
