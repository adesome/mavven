//
//  BBHomeViewController.m
//  maven
//
//  Created by boris becker on 11/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import "BBHomeViewController.h"

@interface BBHomeViewController ()

@end

@implementation BBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    
    self.facebookLoginButton.sideColor = [UIColor colorWithRed:(59.0f/255.0f) green:(89.0f/255.0f) blue:(152.0f/255.0f) alpha:1.0];
    self.facebookLoginButton.faceColor = [UIColor colorWithRed:(59.0f/255.0f) green:(89.0f/255.0f) blue:(152.0f/255.0f) alpha:1.0];
    self.facebookLoginButton.borderColor = [UIColor colorWithRed:(59.0f/255.0f) green:(89.0f/255.0f) blue:(152.0f/255.0f) alpha:1.0];
    
    self.facebookLoginButton.radius = 4;
    self.facebookLoginButton.depth = 1;
    self.facebookLoginButton.margin = 1;
    self.facebookLoginButton.borderWidth = 0;
    
    */
    /*
    [_facebookLoginButton setFaceColor:[UIColor colorWithRed:(59.0f/255.0f) green:(89.0f/255.0f) blue:(152.0f/255.0f) alpha:1.0] forState:UIControlStateNormal];
    [_facebookLoginButton setFaceColor:[UIColor colorWithRed:(70.0f/255.0f) green:(89.0f/255.0f) blue:(180.0f/255.0f) alpha:1.0] forState:UIControlStateHighlighted];
    
    self.facebookLoginButton.depth = 0;
    self.facebookLoginButton.margin = 0;
    */
    //self.facebookLoginButton.faceColor = [UIColor colorWithRed:(59.0f/255.0f) green:(89.0f/255.0f) blue:(152.0f/255.0f) alpha:1.0];
    //self.facebookLoginButton.faceColor = [UIColor colorWithRed:(59.0f/255.0f) green:(89.0f/255.0f) blue:(152.0f/255.0f) alpha:1.0];
    
    
    // Tap gesture recognizer for facebookLogin view
    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(facebookLoginViewTapped:)];
    
    [self.facebookLoginView addGestureRecognizer:tapGestureRecognizer];
    self.facebookLoginView.userInteractionEnabled = YES;
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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

- (void)facebookLoginViewTapped:(UITapGestureRecognizer*)gestureRecognizer {
    NSLog(@"facebookLoginViewTapped");
}

@end
