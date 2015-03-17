//
//  ShowExperienceViewController.h
//  CVApp
//
//  Created by Cupidon Denison on 11/19/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowExperienceViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *companyUIPicker;
@property (weak, nonatomic) IBOutlet UILabel *positionUILsbel;
@property (weak, nonatomic) IBOutlet UILabel *startYearUILabel;
@property (weak, nonatomic) IBOutlet UILabel *endYearULabel;

@end
