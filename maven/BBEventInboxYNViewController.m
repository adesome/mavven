//
//  BBEventInboxYNViewController.m
//  maven
//
//  Created by boris becker on 15/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import "BBEventInboxYNViewController.h"

#import "UIButton+PPiAwesome.h"
#import "UIAwesomeButton.h"

@interface BBEventInboxYNViewController ()

@end

@implementation BBEventInboxYNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Button
    [self.yesButton setIsAwesome:YES];
    [self.yesButton setButtonText:@"Yes, I'm going"];
    [self.yesButton setTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor whiteColor]} forUIControlState:UIControlStateNormal];
    [self.yesButton setRadius:2.0];
    [self.yesButton setBackgroundColor:[UIColor colorWithRed:97.0f/255 green:204.0f/255 blue:129.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [self.yesButton setBackgroundColor:[UIColor colorWithRed:84.0f/255 green:172.0f/255 blue:110.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
    
    [self.noButton setIsAwesome:YES];
    [self.noButton setButtonText:@"Can't make it"];
    [self.noButton setTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor whiteColor]} forUIControlState:UIControlStateNormal];
    [self.noButton setRadius:2.0];
    [self.noButton setBackgroundColor:[UIColor colorWithRed:253.0f/255 green:122.0f/255 blue:112.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [self.noButton setBackgroundColor:[UIColor colorWithRed:224.0f/255 green:109.0f/255 blue:100.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
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

- (IBAction)yesButtonSelected:(id)sender {
}

- (IBAction)noButtonSelected:(id)sender {
}

@end
