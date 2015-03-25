//
//  BBSignupEmailViewController.m
//  maven
//
//  Created by boris becker on 14/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import "BBSignupEmailViewController.h"
#import "BBPhoneNumberViewController.h"
#import "UIButton+PPiAwesome.h"
#import "UIAwesomeButton.h"

@interface BBSignupEmailViewController ()

@end

@implementation BBSignupEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Button
    [self.signupButton setIsAwesome:YES];
    [self.signupButton setButtonText:@"Sign up"];
    [self.signupButton setTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor whiteColor]} forUIControlState:UIControlStateNormal];
    [self.signupButton setRadius:2.0];
    [self.signupButton setBackgroundColor:[UIColor colorWithRed:0.0f/255 green:213.0f/255 blue:228.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [self.signupButton setBackgroundColor:[UIColor colorWithRed:0.0f/255 green:187.0f/255 blue:200.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];

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

- (IBAction)signupButtonAction:(id)sender {
    
    // Check fullname
    NSString * fullnameString = [self.fullnameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSString *fullnameRegex = @"[a-zA-z]+([ '-][a-zA-Z]+)*$";
    NSPredicate *fullnameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", fullnameRegex];
    
    if (![fullnameTest evaluateWithObject:fullnameString]) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Enter valid fullname" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    // Check email address
    NSString * emailString = [self.emailTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if (![emailTest evaluateWithObject:emailString]) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Enter valid email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    // Check password
    NSString * passwordString = [self.passwordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString * confirmString = [self.confirmTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (passwordString.length == 0) {
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Enter valid password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    if (! [passwordString isEqualToString:confirmString]) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Enter valid confirm password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    BBPhoneNumberViewController * phoneNumberViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"phoneNumberViewControllerID"];
    [self.navigationController pushViewController:phoneNumberViewController animated:YES];
    
}

@end
