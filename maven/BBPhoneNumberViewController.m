//
//  BBPhoneNumberViewController.m
//  maven
//
//  Created by boris becker on 14/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import "BBPhoneNumberViewController.h"

#import "BBSideMenuTableViewController.h"

#import "MSDynamicsDrawerViewController.h"
#import "MSDynamicsDrawerStyler.h"





@interface BBPhoneNumberViewController ()

@end

@implementation BBPhoneNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButtonAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)continueButtonAction:(id)sender {
    
    // Present dynamics drawer view controller
    self.dynamicsDrawerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"dynamicsDrawerViewControllerID"];
    
    [self.navigationController presentViewController:self.dynamicsDrawerViewController animated:YES completion:nil];
    
    // Add some example stylers
    [self.dynamicsDrawerViewController addStylersFromArray:@[[MSDynamicsDrawerScaleStyler styler], [MSDynamicsDrawerFadeStyler styler]] forDirection:MSDynamicsDrawerDirectionLeft];
    [self.dynamicsDrawerViewController addStylersFromArray:@[[MSDynamicsDrawerParallaxStyler styler]] forDirection:MSDynamicsDrawerDirectionRight];
    
    // Menu
    BBSideMenuTableViewController *menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"sideMenuViewControllerID"];
    
    menuViewController.dynamicsDrawerViewController = self.dynamicsDrawerViewController;
    [self.dynamicsDrawerViewController setDrawerViewController:menuViewController forDirection:MSDynamicsDrawerDirectionLeft];
    
    // Transition to the Event Inbox view controller
    [menuViewController transitionToViewController:BBPaneViewControllerTypeEventInbox];
}

@end
