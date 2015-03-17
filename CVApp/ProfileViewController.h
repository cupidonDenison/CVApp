//
//  ProfileViewController.h
//  CVApp
//
//  Created by Cupidon Denison on 11/7/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"

@interface ProfileViewController : UIViewController<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *surnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;
@property (weak, nonatomic) IBOutlet UITextField *address1TextFeld;
@property (weak, nonatomic) IBOutlet UITextField *address2TextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;


@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *surname;
@property (strong,nonatomic) NSString *mobile;
@property (strong,nonatomic) NSString *address1;
@property (strong,nonatomic) NSString *address2;
@property (strong,nonatomic) NSString *city;
@property (strong,nonatomic) NSMutableArray * contentFromDictionary;

- (IBAction)profileSave:(id)sender;

@end
