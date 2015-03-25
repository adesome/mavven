//
//  BBSideMenuTableViewCell.m
//  maven
//
//  Created by boris becker on 18/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import "BBSideMenuTableViewCell.h"

@implementation BBSideMenuTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [super awakeFromNib];
    
    self.celllabelContainView.layer.cornerRadius = 5.0f;
    self.celllabelContainView.layer.masksToBounds = YES;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
