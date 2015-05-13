//
//  BBLoginViewController.h
//  maven
//
//  Created by boris becker on 22/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBLoginView.h>

@class MSDynamicsDrawerViewController;

@interface BBLoginViewController : UIViewController<FBLoginViewDelegate>

@property (strong, nonatomic) MSDynamicsDrawerViewController *dynamicsDrawerViewController;

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)backButtonAction:(id)sender;

- (IBAction)loginButtonSelected:(id)sender;


@end
