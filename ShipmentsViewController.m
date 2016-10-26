//
//  ShipmentsViewController.m
//  everfreight
//
//  Created by Kyle Holsey on 8/5/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import "ShipmentsViewController.h"
#import "ShipCell.h"
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>
#import "Kumulos.h"

@interface ShipmentsViewController ()

@end

@implementation ShipmentsViewController{
    
    __weak IBOutlet UIRefreshControl *refresh;

    
}
- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    
}

- (void)viewDidLoad {
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.searchBar.delegate = self;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    mainArray = [[NSMutableArray alloc]init];
    
    Kumulos* km = [[Kumulos alloc]init];
    
    [km setDelegate:self];
    
    [km getShipWithPickupAddress:@"pickupAddress" andDropoffAddress:@"dropoffAddress" andLoadWeight:@"loadWeight" andEquipmentType:@"equipmentType" ];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    


    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    
    refreshControl.backgroundColor = [UIColor lightGrayColor];
   refreshControl.tintColor = [UIColor whiteColor];

    [self.tableView reloadData];
    
}
- (void)refresh:(UIRefreshControl *)refreshControl {
    // Do your job, when done:
     [self.tableView reloadData];
    [refreshControl endRefreshing];
    
}


- (IBAction)btnLoadPressed:(id)sender {
    
    [self.tableView reloadData];
 
    
}
- (IBAction)btnContactPressed:(id)sender {
    
    //change this to a label 
    
    NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
    
    long row = [myIndexPath row];
    
    NSString *pickupAddy = [mainArray[row]objectForKey:@"pickupAddress"];
    NSString *dropoffAddy = [mainArray[row]objectForKey:@"dropoffAddress"];
    
    
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Shipment Selected" message:[NSString stringWithFormat:@"\n From: %@ \n To: %@ \n \n Please enter your MC# and contact number.", pickupAddy, dropoffAddy] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [av setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    
    // Alert style customization
    [[av textFieldAtIndex:1] setSecureTextEntry:NO];
    [[av textFieldAtIndex:0] setPlaceholder:@"MC#"];
    [[av textFieldAtIndex:1] setPlaceholder:@"Contact Number"];
    [av setTag:5];
    [av show];
 
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    
    NSString *MC = [alertView textFieldAtIndex:0].text;
    NSString *contactNumber = [alertView textFieldAtIndex:1].text;
    
    if (alertView.tag == 5)
    {
    
if (buttonIndex == 0) {
    
    
}
    else if (buttonIndex == 1)
    {
        
        if ([MFMailComposeViewController canSendMail]) {
            
            NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
            
            long row = [myIndexPath row];
            
            NSString *pickupAddy = [mainArray[row]objectForKey:@"pickupAddress"];
            NSString *dropoffAddy = [mainArray[row]objectForKey:@"dropoffAddress"];
     
            
            NSArray *emailAddresses;
            emailAddresses = [[NSArray alloc]initWithObjects:@"operations@everfreight.co", nil];
            
            
            MFMailComposeViewController *emailDialog = [[MFMailComposeViewController alloc] init];
            
            [emailDialog setSubject:@"MOBILE APP - New Pickup Request"];
            
            [emailDialog setMessageBody:[NSString stringWithFormat: @"New Shipment Pickup Request From: \n \n MC#: %@ \n Contact #: %@ \n \n SHIPMENT INFO: \n Pickup Address: %@ \n Drop Off Address: %@\n", MC, contactNumber, pickupAddy, dropoffAddy]isHTML:NO];
            
            [emailDialog setToRecipients:emailAddresses];
            
            emailDialog.mailComposeDelegate = self;
            
            [self presentModalViewController:emailDialog animated:YES];
            
        }
        else {
            
            UIAlertView *alert4 = [[UIAlertView alloc] initWithTitle:@"Email Not Found"
                                                             message:[NSString stringWithFormat:@"To complete your shipment pickup request, please enable email in your device's settings.  This can be done by going to Settings > Mail > Accounts."]
                                                            delegate:self
                                                   cancelButtonTitle:nil
                                                   otherButtonTitles:@"OK", nil];
            
            [alert4 show];
            
            
            
            
        }

    }

        
        
    }
      
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    
    
    
    switch (result) {
            
        case MFMailComposeResultSent:{
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Pick Up Request Received"
                                                            message:[NSString stringWithFormat:@"Thank you for your shipment pickup request. We have received your details and will contact you shortly to confirm."]
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            
         
            
            [alert show];
            
                  [self dismissModalViewControllerAnimated:YES];
            
            
            
        }
            
            
            
            
            
            break;
            
        case MFMailComposeResultSaved:{
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Draft Saved"
                                                            message:[NSString stringWithFormat:@"You have saved a draft of this email."]
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
           
            
            [alert show];
            
                  [self dismissModalViewControllerAnimated:YES];
            
        }
            
            
            break;
        case MFMailComposeResultCancelled:{
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancelled"
                                                            message:[NSString stringWithFormat:@"You have cancelled this email."]
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
                    [alert show];
            [self dismissModalViewControllerAnimated:YES];
            

            
        }
            [self performSegueWithIdentifier:@"homeHome" sender:self];
            

            
                }
    [self performSegueWithIdentifier:@"homeHome" sender:self];
    

    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)kumulosAPI:(Kumulos *)kumulos apiOperation:(KSAPIOperation *)operation getShipDidCompleteWithResult:(NSArray *)theResults
{
    
    mainArray = [theResults copy];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    self.tableView.separatorColor = [UIColor blackColor];
    
       
    int arrayCount;
    arrayCount = [mainArray count];
    
    
    {
        if (isFiltered){
            return [_searchResult count];
        }
        
        {
            return [mainArray count];
            
        }
        
   
}
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText  {
    
    if (searchText.length == 0){
        isFiltered = NO;
        
    }
    else {
        
        isFiltered = YES;
        _searchResult = [[NSArray alloc]init];
        
        
        NSPredicate *cityPred = [NSPredicate predicateWithFormat:@"pickupAddress CONTAINS [c] %@", self.searchBar.text];
        
        NSPredicate *zipPred = [NSPredicate predicateWithFormat:@"dropoffAddress CONTAINS [c] %@", self.searchBar.text];
        
        
        NSPredicate *allPred = [NSCompoundPredicate orPredicateWithSubpredicates:@[cityPred, zipPred]];
        
        
        
        _searchResult = [mainArray filteredArrayUsingPredicate:allPred];
    }
    
    
    
}



-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    
    [self.searchBar resignFirstResponder];
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
 
    
    long row = [indexPath row];
    
    
    static NSString *cellIdentifier =
    @"ShipCell";
    
    ShipCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    if((indexPath.row)==0 || (indexPath.row)==2 || (indexPath.row)==4 || (indexPath.row ==6 || indexPath.row ==8 || (indexPath.row) == 10 || (indexPath.row)==12 || (indexPath.row) ==14 || (indexPath.row)==16 || (indexPath.row)==18 || (indexPath.row)==20))
        
    {
    
    UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 277, 58)];
    av.backgroundColor = [UIColor clearColor];
    av.opaque = NO;
        
 
    av.image = [UIImage imageNamed:@"grayColorPurpleDark.png"];
    cell.backgroundView = av;
        
        
        cell.lblPickUp.textColor = [UIColor groupTableViewBackgroundColor];
         cell.lblDropOff.textColor = [UIColor groupTableViewBackgroundColor];
        cell.lblPickupAddress.textColor = [UIColor groupTableViewBackgroundColor];
        cell.lblDropoffAddress.textColor = [UIColor groupTableViewBackgroundColor];
        cell.lblLoadWeight.textColor = [UIColor groupTableViewBackgroundColor];
        cell.lblEquipmentType.textColor = [UIColor groupTableViewBackgroundColor];
        cell.lblWeight.textColor = [UIColor groupTableViewBackgroundColor];
        cell.lblEquip.textColor = [UIColor groupTableViewBackgroundColor];
        cell.lblContact.textColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];
        cell.lblContact.backgroundColor = [UIColor colorWithRed:197.0/255.0 green:215.0/255.0 blue:226.0/255.0 alpha:1.0];
        

        
}

    else if((indexPath.row)==1 || (indexPath.row)==3 || (indexPath.row)==5 || (indexPath.row ==7 || indexPath.row ==9 || (indexPath.row) == 11 || (indexPath.row)==13 || (indexPath.row) ==15 || (indexPath.row)==17 || (indexPath.row)==19 || (indexPath.row)==21))

    
    {
        
        
        UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 277, 58)];
        av.backgroundColor = [UIColor clearColor];
        av.opaque = NO;
        
        av.image = [UIImage imageNamed:@"grayColorBack.png"];
        
        
        cell.backgroundView = av;
    
        
        cell.lblPickUp.textColor = [UIColor blackColor];
        cell.lblDropOff.textColor = [UIColor blackColor];
        cell.lblPickupAddress.textColor = [UIColor blackColor];
        cell.lblDropoffAddress.textColor = [UIColor blackColor];
        cell.lblLoadWeight.textColor = [UIColor blackColor];
        cell.lblEquipmentType.textColor = [UIColor blackColor];
        cell.lblWeight.textColor = [UIColor blackColor];
        cell.lblEquip.textColor = [UIColor blackColor];
        cell.lblContact.textColor = [UIColor whiteColor];
        cell.lblContact.backgroundColor = [UIColor colorWithRed:36.0/255.0 green:15.0/255.0 blue:86.0/255.0 alpha:1.0];
        

        
    }
    
       
    if(!isFiltered){

        
        cell.lblPickupAddress.text = [mainArray[row]objectForKey:@"pickupAddress"];
        cell.lblDropoffAddress.text = [mainArray[row]objectForKey:@"dropoffAddress"];
        cell.lblLoadWeight.text = [mainArray[row]objectForKey:@"loadWeight"];
        cell.lblEquipmentType.text = [mainArray[row]objectForKey:@"equipmentType"];
        
    
           }

    else{
        
        
        cell.lblPickupAddress.text = [_searchResult[row]objectForKey:@"pickupAddress"];
        cell.lblDropoffAddress.text = [_searchResult[row]objectForKey:@"dropoffAddress"];
        cell.lblLoadWeight.text = [_searchResult[row]objectForKey:@"loadWeight"];
        cell.lblEquipmentType.text = [_searchResult[row]objectForKey:@"equipmentType"];

    }

    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    
    NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
    
    long row = [myIndexPath row];
    
    NSString *pickupAddy = [mainArray[row]objectForKey:@"pickupAddress"];
    NSString *dropoffAddy = [mainArray[row]objectForKey:@"dropoffAddress"];
    
    
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Shipment Selected" message:[NSString stringWithFormat:@"\n From: %@ \n To: %@ \n \n Please enter your MC# and contact number.", pickupAddy, dropoffAddy] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [av setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    
    // Alert style customization
    [[av textFieldAtIndex:1] setSecureTextEntry:NO];
    [[av textFieldAtIndex:0] setPlaceholder:@"MC#"];
    [[av textFieldAtIndex:1] setPlaceholder:@"Contact Number"];
    [av setTag:5];
    [av show];
    

    
    
    
    
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
