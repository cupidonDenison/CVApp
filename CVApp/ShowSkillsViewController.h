//
//  ShowSkillsViewController.h
//  CVApp
//
//  Created by Cupidon Denison on 11/19/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowSkillsViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *areaUIPickerView;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;

@end
