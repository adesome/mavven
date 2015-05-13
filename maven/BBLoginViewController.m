//
//  BBLoginViewController.m
//  maven
//
//  Created by boris becker on 22/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import "BBLoginViewController.h"

#import "BBSideMenuTableViewController.h"

#import "UIButton+PPiAwesome.h"
#import "UIAwesomeButton.h"

#import "MSDynamicsDrawerViewController.h"
#import "MSDynamicsDrawerStyler.h"

#import "MBProgressHUD.h"

#import <Parse/Parse.h>


@interface BBLoginViewController ()

@end

@implementation BBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Button
    [self.loginButton setIsAwesome:YES];
    [self.loginButton setButtonText:@"Login"];
    [self.loginButton setTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor whiteColor]} forUIControlState:UIControlStateNormal];
    [self.loginButton setRadius:2.0];
    [self.loginButton setBackgroundColor:[UIColor colorWithRed:0.0f/255 green:213.0f/255 blue:228.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [self.loginButton setBackgroundColor:[UIColor colorWithRed:0.0f/255 green:187.0f/255 blue:200.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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

- (IBAction)loginButtonSelected:(id)sender {
    
    // Check email address
    NSString * emailString = [self.emailTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if (![emailTest evaluateWithObject:emailString]) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Enter valid email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    // Check password
    NSString * passwordString = [self.passwordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (passwordString.length == 0) {
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Enter valid password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    NSLog(@"email:%@", emailString);
    NSLog(@"password:%@", passwordString);
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading";
    [hud show:YES];
    
    [PFUser logInWithUsernameInBackground:emailString password:passwordString block:^(PFUser *user, NSError *error) {
        if (user) {
            // Login successful
            [hud hide:YES];
            
            [self gotoEventInbox];
            
        } else {
            // Login failed.
            [hud hide:YES];
            
            NSString * errString = [error userInfo][@"error"];
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:errString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
    
    // Go to rootview controller.
    [self.navigationController popToRootViewControllerAnimated:NO];

}


@end
