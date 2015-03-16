//
//  BBSideMenuTableViewController.h
//  maven
//
//  Created by boris becker on 15/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MSDynamicsDrawerViewController;

typedef NS_ENUM(NSUInteger, BBPaneViewControllerType) {
    BBPaneViewControllerTypeProfile,
    BBPaneViewControllerTypeMyEvents,
    BBPaneViewControllerTypeEventInbox,
    BBPaneViewControllerTypeSendFeedback,
    BBPaneViewControllerTypeLogout,
    MSPaneViewControllerTypeCount
};

@interface BBSideMenuTableViewController : UITableViewController

@property (nonatomic, assign) BBPaneViewControllerType paneViewControllerType;
@property (nonatomic, weak) MSDynamicsDrawerViewController *dynamicsDrawerViewController;

- (void)transitionToViewController:(BBPaneViewControllerType)paneViewControllerType;

@end
