//
//  BBPhoneNumberViewController.h
//  maven
//
//  Created by boris becker on 14/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MSDynamicsDrawerViewController;

@interface BBPhoneNumberViewController : UIViewController

@property (strong, nonatomic) MSDynamicsDrawerViewController *dynamicsDrawerViewController;

@property (weak, nonatomic) IBOutlet UITextField *phonenumberTextField;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;

- (IBAction)backButtonAction:(id)sender;
- (IBAction)continueButtonAction:(id)sender;

@property (strong, nonatomic) NSString * fullname;
@property (strong, nonatomic) NSString * email;
@property (strong, nonatomic) NSString * password;

@end
