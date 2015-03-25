//
//  BBHomeViewController.h
//  maven
//
//  Created by boris becker on 11/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBHomeViewController : UIViewController

- (IBAction)loginButtonSelected:(id)sender;

- (IBAction)signupButtonSelected:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIButton *signupButton;

@end
