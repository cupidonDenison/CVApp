//
//  AddResultViewController.h
//  CVApp
//
//  Created by Cupidon Denison on 11/21/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddResultViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *qualificationUIPickerView;

@property (strong, nonatomic) IBOutlet UITextField *subject1TextField;
@property (strong, nonatomic) IBOutlet UITextField *grade1TextField;
- (IBAction)saveAction:(id)sender;

@end
