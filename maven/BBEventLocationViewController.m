//
//  BBEventLocationViewController.m
//  maven
//
//  Created by boris becker on 20/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import "BBEventLocationViewController.h"
#import "BBEventLocationTableViewCell.h"

@interface BBEventLocationViewController ()

@end

@implementation BBEventLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

#pragma mark - UISearchBarDelegate Implementation

- (void) searchBar:(UISearchBar*)searchBar textDidChange:(NSString *)searchText {
    
    
}

- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
}

#pragma mark - UITableViewDelegate Implementation

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 1.0f;
}

- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UITableViewDataSource Implementation

- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BBEventLocationTableViewCell * cell = (BBEventLocationTableViewCell*)[self.locationTableView dequeueReusableCellWithIdentifier:@"eventLocationTableViewCellID"];
    
    return cell;
}

@end
