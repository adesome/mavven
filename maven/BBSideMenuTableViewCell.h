//
//  BBSideMenuTableViewCell.h
//  maven
//
//  Created by boris becker on 18/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BBSideMenuTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellItemIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellItemTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellItemBadgeLabel;
@property (weak, nonatomic) IBOutlet UIView *celllabelContainView;


@end
