//
//  BBLoginViewController.m
//  maven
//
//  Created by boris becker on 22/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import "BBLoginViewController.h"

@interface BBLoginViewController ()

@end

@implementation BBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.facebookLoginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
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
    
    NSString * email = self.emailTextField.text;
    NSString * password = self.passwordTextField.text;
    
    NSLog(@"Email: %@", email);
    NSLog(@"Password: %@", password);
}

@end
