//
//  ShowEducationViewController.h
//  CVApp
//
//  Created by Cupidon Denison on 11/14/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowEducationViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *institutionSelect;

@property (weak, nonatomic) IBOutlet UILabel *qualificationLabel;
@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *endDateLabel;

- (IBAction)viewResultAction:(id)sender;
+(NSString *) qualif;
@end
