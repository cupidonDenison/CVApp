//
//  InfoViewController.m
//  CVApp
//
//  Created by Cupidon Denison on 11/7/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import "InfoViewController.h"
#import "ProfileViewController.h"

@interface InfoViewController ()

    @property(nonatomic,strong) NSString *documentPath,* documentPlistPath;

@end

@implementation InfoViewController

NSString *plistPath;
NSDictionary *myDict;
NSArray *profile;

- (void)viewDidLoad {
    [super viewDidLoad];
    plistPath = [[NSBundle mainBundle] pathForResource:@"CvAppPList" ofType:@"plist"];
   
    
    _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _documentPlistPath = [_documentPath stringByAppendingPathComponent:@"CvAppPList.plist"];
    
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    //check if file is in document directory if not coy file from main bundle to document directory
    
    if(![manager fileExistsAtPath:_documentPlistPath]){
        
        [manager copyItemAtPath:plistPath toPath:_documentPlistPath error:nil];
        
        
    }//end if statement

     myDict = [[NSDictionary alloc] initWithContentsOfFile:_documentPlistPath];
    
   NSLog(@"%@",myDict);
    
    profile = [myDict objectForKey:@"profile"];
   // NSLog(@"%@",profile);
    
    NSString *name = [profile objectAtIndex:0];
    NSString *surname = [profile objectAtIndex:1];
    NSString *mobile= [profile objectAtIndex:2];
    NSString *address1 = [profile objectAtIndex:3];
    NSString *address2 = [profile objectAtIndex:4];
    NSString *city = [profile objectAtIndex:5];
    
    //NSLog(@"%@",name);
    
    
    self.personalInfoLabel.text = name;
    self.surnameLabel.text = surname;
    _mobileLabel.text = mobile;
    _address1Label.text = address1;
    _address2Label.text=address2;
    _cityLabel.text=city;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
