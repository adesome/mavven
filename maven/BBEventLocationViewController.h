//
//  BBEventLocationViewController.h
//  maven
//
//  Created by boris becker on 20/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBEventLocationViewController : UIViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISearchBar *locationSearchBar;
@property (weak, nonatomic) IBOutlet UITableView *locationTableView;

@end
