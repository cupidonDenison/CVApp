//
//  Profile.h
//  CVApp
//
//  Created by Cupidon Denison on 11/7/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property NSString *name;
@property NSString *surname;
@property NSString *mobile;
@property NSString *address1;
@property NSString *address2;
@property NSString *city;

-(NSString *) printProfle;

@end
