//
//  EducationViewController.h
//  CVApp
//
//  Created by Cupidon Denison on 11/6/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EducationViewController : UIViewController<UIAlertViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *institutionTextField;
@property (weak, nonatomic) IBOutlet UITextField *qualificationTextField;
@property (weak, nonatomic) IBOutlet UITextField *startYearTextField;

@property (weak, nonatomic) IBOutlet UITextField *endYearTextField;
- (IBAction)ActionSave:(id)sender;
- (IBAction)addResultAction:(id)sender;


@end
