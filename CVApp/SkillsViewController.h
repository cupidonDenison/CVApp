//
//  SkillsViewController.h
//  CVApp
//
//  Created by Cupidon Denison on 11/7/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillsViewController : UIViewController<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *areaTextField;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
- (IBAction)saveAction:(id)sender;

@end
