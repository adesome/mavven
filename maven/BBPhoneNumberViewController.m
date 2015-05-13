//
//  BBPhoneNumberViewController.m
//  maven
//
//  Created by boris becker on 14/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import "BBPhoneNumberViewController.h"

#import "BBSideMenuTableViewController.h"
#import "BBCreateEventViewController.h"

#import "MSDynamicsDrawerViewController.h"
#import "MSDynamicsDrawerStyler.h"

#import "UIButton+PPiAwesome.h"
#import "UIAwesomeButton.h"

#import "MBProgressHUD.h"

#import <Parse/Parse.h>

@interface BBPhoneNumberViewController ()

@end

@implementation BBPhoneNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Button
    [self.continueButton setIsAwesome:YES];
    [self.continueButton setButtonText:@"Continue"];
    [self.continueButton setTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor whiteColor]} forUIControlState:UIControlStateNormal];
    [self.continueButton setRadius:2.0];
    [self.continueButton setBackgroundColor:[UIColor colorWithRed:0.0f/255 green:213.0f/255 blue:228.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [self.continueButton setBackgroundColor:[UIColor colorWithRed:0.0f/255 green:187.0f/255 blue:200.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
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
    
    // Check phone number
    NSString * phonenumberString = self.phonenumberTextField.text;
    
    NSString *phonenumberRegex = @"[0-9]{7}([0-9])*";
    NSPredicate *phonenumberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phonenumberRegex];
    
    if (![phonenumberTest evaluateWithObject:phonenumberString]) {
     
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Enter valid phone number" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading";
    [hud show:YES];
   
    // Sign up process
    PFUser *user = [PFUser user];
    user.username = self.email;
    user.password = self.password;
    user.email = self.email;
    [user setObject:self.fullname forKey:@"fullname"];
    [user setObject:phonenumberString forKey: @"phone"];
        
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            [hud hide:YES];
            
            [self gotoEventInbox];
            
        } else {
            
            [hud hide:YES];
            
            NSString *errorString = [error userInfo][@"error"];
            
            // Show the errorString somewhere and let the user try again.
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            return;
        }
    }];
}

- (void)gotoEventInbox {
    
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

- (void)gotoEventCreation {
    
    BBCreateEventViewController *createEventViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"createEventViewControllerID"];
    
    // Present createeventview controller
    [self.navigationController presentViewController:createEventViewController animated:YES completion:nil];
}

@end
