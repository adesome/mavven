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

- (IBAction)backButtonAction:(id)sender;
- (IBAction)continueButtonAction:(id)sender;

@end
