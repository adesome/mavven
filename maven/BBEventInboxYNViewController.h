//
//  BBEventInboxYNViewController.h
//  maven
//
//  Created by boris becker on 15/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBEventInboxYNViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *yesButton;
@property (weak, nonatomic) IBOutlet UIButton *noButton;

- (IBAction)yesButtonSelected:(id)sender;
- (IBAction)noButtonSelected:(id)sender;
@end
