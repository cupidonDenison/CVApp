//
//  Profile.m
//  CVApp
//
//  Created by Cupidon Denison on 11/7/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import "Profile.h"

@implementation Profile


-(NSString *) printProfle{
    NSString *personalInfo;
    
    personalInfo =[NSString stringWithFormat:@"%@ \r %@\r %@\r %@\r %@\r %@",_name,_surname,_mobile,_address1,_address2,_city];
    return personalInfo;
}

@end
