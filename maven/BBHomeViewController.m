//
//  BBHomeViewController.m
//  maven
//
//  Created by boris becker on 11/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import "BBHomeViewController.h"
#import "BBPhoneNumberViewController.h"

#import "UIButton+PPiAwesome.h"
#import "UIAwesomeButton.h"

#import "MBProgressHUD.h"

#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface BBHomeViewController ()
{
    FBLoginView *_facebookLoginView;
}
@end

@interface FBSession (Private)

- (void)clearAffinitizedThread;

@end

@implementation BBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Button
    self.facebookLoginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    self.facebookLoginButton.delegate = self;
    self.facebookLoginButton.tooltipBehavior = FBLoginViewTooltipBehaviorDisable;
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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

- (IBAction)loginButtonSelected:(id)sender {

}

- (IBAction)signupButtonSelected:(id)sender {
 
}

#pragma mark - FBLoginViewDelegate

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    [self handleFacebookSession];
}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    [self handleLogInError:error];
}

- (void)handleFacebookSession {
    
    if ([PFUser currentUser]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(logInViewControllerDidLogUserIn:)]) {
            [self.delegate performSelector:@selector(logInViewControllerDidLogUserIn:) withObject:[PFUser currentUser]];
        }
        return;
    }
    
    NSString *accessToken = [[[FBSession activeSession] accessTokenData] accessToken];
    NSDate *expirationDate = [[[FBSession activeSession] accessTokenData] expirationDate];
    NSString *facebookUserId = [[[FBSession activeSession] accessTokenData] userID];
    
    if (!accessToken || !facebookUserId) {
        NSLog(@"Login failure. FB Access Token or user ID does not exist");
        return;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading";
    [hud show:YES];
    
    
    // Unfortunately there are some issues with accessing the session provided from FBLoginView with the Parse SDK's (thread affinity)
    // Just work around this by setting the session to nil, since the relevant values will be discarded anyway when linking with Parse (permissions flag on FBAccessTokenData)
    // that we need to get back again with a refresh of the session
    if ([[FBSession activeSession] respondsToSelector:@selector(clearAffinitizedThread)]) {
        [[FBSession activeSession] performSelector:@selector(clearAffinitizedThread)];
    }
    
    [PFFacebookUtils logInWithFacebookId:facebookUserId
                             accessToken:accessToken
                          expirationDate:expirationDate
                                   block:^(PFUser *user, NSError *error) {
                                       
                                       [hud hide:YES];
                                       
                                       if (!error) {
                                           
                                           if (self.delegate) {
                                               if ([self.delegate respondsToSelector:@selector(logInViewControllerDidLogUserIn:)]) {
                                                   [self.delegate performSelector:@selector(logInViewControllerDidLogUserIn:) withObject:user];
                                               }
                                           }
                                           
                                           // Goto the phone number page
                                           BBPhoneNumberViewController * phoneNumberViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"phoneNumberViewControllerID"];
                                           
                                           [self.navigationController pushViewController:phoneNumberViewController animated:YES];
                                           
                                       } else {
                                           
                                           [self cancelLogIn:error];
                                       }
                                   }];
}

#pragma mark - (Login Error)

- (void)cancelLogIn:(NSError *)error {
    
    if (error) {
        [self handleLogInError:error];
    }
    
    [[FBSession activeSession] closeAndClearTokenInformation];
    [PFUser logOut];
}

- (void)handleLogInError:(NSError *)error {
    if (error) {
        NSLog(@"Error: %@", [[error userInfo] objectForKey:@"com.facebook.sdk:ErrorLoginFailedReason"]);
        NSString *title = NSLocalizedString(@"Login Error", @"Login error title in PAPLogInViewController");
        NSString *message = NSLocalizedString(@"Something went wrong. Please try again.", @"Login error message in PAPLogInViewController");
        
        if ([[[error userInfo] objectForKey:@"com.facebook.sdk:ErrorLoginFailedReason"] isEqualToString:@"com.facebook.sdk:UserLoginCancelled"]) {
            return;
        }
        
        if (error.code == kPFErrorFacebookInvalidSession) {
            NSLog(@"Invalid session, logging out.");
            [[FBSession activeSession] closeAndClearTokenInformation];
            return;
        }
        
        if (error.code == kPFErrorConnectionFailed) {
            NSString *ok = NSLocalizedString(@"OK", @"OK");
            NSString *title = NSLocalizedString(@"Offline Error", @"Offline Error");
            NSString *message = NSLocalizedString(@"Something went wrong. Please try again.", @"Offline message");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:ok, nil];
            [alert show];
            
            return;
        }
        
        NSString *ok = NSLocalizedString(@"OK", @"OK");
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                            message:message
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:ok, nil];
        [alertView show];
    }
}

@end
