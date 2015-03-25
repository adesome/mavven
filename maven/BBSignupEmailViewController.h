//
//  BBSignupEmailViewController.h
//  maven
//
//  Created by boris becker on 14/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBSignupEmailViewController : UIViewController

- (IBAction)backButtonAction:(id)sender;
- (IBAction)signupButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *fullnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmTextField;

@property (weak, nonatomic) IBOutlet UIButton *signupButton;

@end
