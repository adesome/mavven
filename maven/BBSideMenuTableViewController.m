//
//  BBSideMenuTableViewController.m
//  maven
//
//  Created by boris becker on 15/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import "BBSideMenuTableViewController.h"

#import "MSDynamicsDrawerViewController.h"
#import "MSDynamicsDrawerStyler.h"

#import "BBSideMenuTableViewCell.h"

#import <Parse.h>

NSString * const BBSideMenuTableCellReuseIdentifier = @"sideMenuTableViewCellID";

@interface BBSideMenuTableViewController ()

@property (nonatomic, strong) NSDictionary *paneViewControllerTitles;
@property (nonatomic, strong) NSDictionary *paneViewControllerIdentifiers;
@property (nonatomic, strong) NSDictionary *sideMenuIcons;

@end

@implementation BBSideMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorColor = [UIColor colorWithRed:(35.0f/255.0f) green:(35.0f/255.0f) blue:(35.0f/255.0f) alpha:0.25];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return MSPaneViewControllerTypeCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BBSideMenuTableViewCell *cell = (BBSideMenuTableViewCell*)[tableView dequeueReusableCellWithIdentifier:BBSideMenuTableCellReuseIdentifier];
    
    // Configure the cell...
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"BBSideMenuTableViewCell" bundle:nil] forCellReuseIdentifier:BBSideMenuTableCellReuseIdentifier];
        cell = (BBSideMenuTableViewCell*)[tableView dequeueReusableCellWithIdentifier:BBSideMenuTableCellReuseIdentifier];
    }

    // Separator color
    tableView.separatorColor = [UIColor colorWithRed:(35.0f/255.0f) green:(35.0f/255.0f) blue:(35.0f/255.0f) alpha:1.0];
    
    cell.celllabelContainView.frame = CGRectZero;
    
    // Cell
    NSString* cellIconName = @"";
    NSString* cellTitle = @"";
    NSString* cellBadge = @"1";
    
    cellIconName = self.sideMenuIcons[@(indexPath.row)];
    cellTitle = self.paneViewControllerTitles[@(indexPath.row)];
    
    cell.backgroundColor = [UIColor clearColor];
    [cell.cellItemIconImageView setImage:[UIImage imageNamed:cellIconName]];
    [cell.cellItemTitleLabel setText:cellTitle];
    
    if (indexPath.row == BBPaneViewControllerTypeEventInbox) {
        
        [cell.cellItemBadgeLabel setText:cellBadge];
        
        {
            UIFont * mFont = cell.cellItemBadgeLabel.font;
            NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
            paragraphStyle.lineBreakMode = cell.cellItemBadgeLabel.lineBreakMode;
            
            NSDictionary * attributes = @{NSFontAttributeName : mFont , NSParagraphStyleAttributeName : paragraphStyle};
            CGSize expectedLabelSize = [cellBadge sizeWithAttributes:attributes];
            
            CGRect txtRect = [cellBadge boundingRectWithSize:expectedLabelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
            
            cell.cellItemBadgeLabel.frame = txtRect;
         
            [cell.cellItemBadgeLabel layoutIfNeeded];
            [cell.cellItemBadgeLabel updateConstraints];
        }
    }
    else {
        [cell.celllabelContainView setHidden:YES];
    }
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new]; // Hacky way to prevent extra dividers after the end of the table from showing
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN; // Hacky way to prevent extra dividers after the end of the table from showing
}

#pragma mark - NSObject

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

#pragma mark - UIViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initialize];
    }
    return self;
}

#pragma mark - BBSideMenuTableViewController

- (void)initialize
{
    self.paneViewControllerType = NSUIntegerMax;
    self.paneViewControllerTitles = @{
                                      @(BBPaneViewControllerTypeProfile) : @"Profile",
                                      @(BBPaneViewControllerTypeMyEvents) : @"My Events",
                                      @(BBPaneViewControllerTypeEventInbox) : @"Event Inbox",
                                      @(BBPaneViewControllerTypeSendFeedback) : @"Send Feedback",
                                      @(BBPaneViewControllerTypeLogout) : @"Logout"
                                      };

    self.paneViewControllerIdentifiers = @{                                           
                                           @(BBPaneViewControllerTypeProfile) : @"profileViewControllerID",
                                           @(BBPaneViewControllerTypeMyEvents) : @"myEventsViewControllerID",
                                           @(BBPaneViewControllerTypeEventInbox) : @"eventInboxYNViewControllerID",
                                           @(BBPaneViewControllerTypeSendFeedback) : @"sendFeedbackViewControllerID",
                                           @(BBPaneViewControllerTypeLogout) : @""
                                           };
    self.sideMenuIcons = @{
                                      @(BBPaneViewControllerTypeProfile) : @"",
                                      @(BBPaneViewControllerTypeMyEvents) : @"menu-myevent",
                                      @(BBPaneViewControllerTypeEventInbox) : @"menu-inbox",
                                      @(BBPaneViewControllerTypeSendFeedback) : @"menu-feedback",
                                      @(BBPaneViewControllerTypeLogout) : @"menu-logout"
                                      };
}

- (BBPaneViewControllerType)paneViewControllerTypeForIndexPath:(NSIndexPath *)indexPath
{
    BBPaneViewControllerType paneViewControllerType;
    if (indexPath.section == 0) {
        paneViewControllerType = indexPath.row;
    } else {
        paneViewControllerType = NSUIntegerMax;
    }
    NSAssert(paneViewControllerType < MSPaneViewControllerTypeCount, @"Invalid Index Path");
    return paneViewControllerType;
}

- (void)transitionToViewController:(BBPaneViewControllerType)paneViewControllerType
{
    NSLog(@"PaneType: %@", self.paneViewControllerIdentifiers[@(paneViewControllerType)]);
    
    // Close pane if already displaying that pane view controller
    if (paneViewControllerType == self.paneViewControllerType) {
        [self.dynamicsDrawerViewController setPaneState:MSDynamicsDrawerPaneStateClosed animated:YES allowUserInterruption:YES completion:nil];
        return;
    }
    
    BOOL animateTransition = self.dynamicsDrawerViewController.paneViewController != nil;
    
    // Navigation controller
    UIViewController *paneViewController = [self.storyboard instantiateViewControllerWithIdentifier:self.paneViewControllerIdentifiers[@(paneViewControllerType)]];
    
    UINavigationController *paneNavigationViewController = [[UINavigationController alloc] initWithRootViewController:paneViewController];
    
    [self.dynamicsDrawerViewController setPaneViewController:paneNavigationViewController animated:animateTransition completion:nil];

    self.paneViewControllerType = paneViewControllerType;
}

- (void)dynamicsDrawerRevealLeftBarButtonItemTapped:(id)sender
{
    [self.dynamicsDrawerViewController setPaneState:MSDynamicsDrawerPaneStateOpen inDirection:MSDynamicsDrawerDirectionLeft animated:YES allowUserInterruption:YES completion:nil];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BBPaneViewControllerType paneViewControllerType = [self paneViewControllerTypeForIndexPath:indexPath];
    
    if (paneViewControllerType == BBPaneViewControllerTypeLogout) {
        
        // Logout
        [PFUser logOut];
        
        // Dismiss
        [self.dynamicsDrawerViewController dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        [self transitionToViewController:paneViewControllerType];
    }
    
    // Prevent visual display bug with cell dividers
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.tableView reloadData];
    });
}

#pragma mark - MSDynamicsDrawerViewControllerDelegate

- (void)dynamicsDrawerViewController:(MSDynamicsDrawerViewController *)dynamicsDrawerViewController didUpdateToPaneState:(MSDynamicsDrawerPaneState)state
{
    // Ensure that the pane's table view can scroll to top correctly
    self.tableView.scrollsToTop = (state == MSDynamicsDrawerPaneStateOpen);
}

@end
