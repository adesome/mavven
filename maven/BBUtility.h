//
//  BBUtility.h
//  maven
//
//  Created by boris becker on 31/03/15.
//  Copyright (c) 2015 mavenapp. All rights reserved.
//

#import <Parse/Parse.h>
#import <Foundation/Foundation.h>

@interface BBUtility : NSObject

+ (void)processFacebookProfilePictureData:(NSData *)data;

+ (BOOL)userHasValidFacebookData:(PFUser *)user;
+ (BOOL)userHasProfilePictures:(PFUser *)user;
+ (UIImage *)defaultProfilePicture;

@end
