//
//  BBLoginViewController.h
//  maven
//
//  Created by boris becker on 22/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBLoginView.h>

@interface BBLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet FBLoginView *facebookLoginButton;

- (IBAction)backButtonAction:(id)sender;

- (IBAction)loginButtonSelected:(id)sender;


@end
