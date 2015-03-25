//
//  BBEventLocationTableViewCell.h
//  maven
//
//  Created by boris becker on 20/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBEventLocationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellItemImaveView;
@property (weak, nonatomic) IBOutlet UILabel *cellItemTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellItemAddressLabel;

@end
