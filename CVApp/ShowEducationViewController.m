//
//  ShowEducationViewController.m
//  CVApp
//
//  Created by Cupidon Denison on 11/14/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import "ShowEducationViewController.h"
#import "ShowSkillsViewController.h"
#import "ViewResultViewController.h"

@interface ShowEducationViewController (){
    
}

 @property(nonatomic,strong) NSString *documentPath,* documentPlistPath;
@end

@implementation ShowEducationViewController


NSString * qualifStr;
NSString *plistPath;
NSDictionary *plistRoot;
NSDictionary *educationDictionary;
NSArray *institutionArray, * startDateArray, *endDateArray, *qualificationArray;

UIStoryboard * mainStory;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _institutionSelect.delegate = self;
    _institutionSelect.dataSource = self;
    _institutionSelect.showsSelectionIndicator = YES;
    [self.view addSubview:_institutionSelect];
    
    plistPath =[[NSBundle mainBundle] pathForResource:@"CvAppPList" ofType:@"plist"];
    
    _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _documentPlistPath = [_documentPath stringByAppendingPathComponent:@"CvAppPList.plist"];
    
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager fileExistsAtPath:_documentPlistPath]){
        
        [manager copyItemAtPath:plistPath toPath:_documentPlistPath error:nil];
        
        
    }//end if statement

    plistRoot =[[NSDictionary alloc] initWithContentsOfFile:_documentPlistPath];
    
    
    educationDictionary = [plistRoot objectForKey:@"education"];
    institutionArray = [educationDictionary objectForKey:@"institution"];
    startDateArray =[educationDictionary objectForKey:@"start"];
    endDateArray =[educationDictionary objectForKey:@"end"];
    qualificationArray =[educationDictionary objectForKey:@"qualification"];
    
    
   if([institutionArray count] >0){
    
    NSString *qualification = [[NSString alloc] initWithFormat:@"%@",[qualificationArray objectAtIndex:0] ];
    NSString * startDate = [[NSString alloc] initWithFormat:@"%@",[startDateArray objectAtIndex:0] ];
    NSString * endDate = [[NSString alloc] initWithFormat:@"%@",[endDateArray objectAtIndex:0] ];
    
    _qualificationLabel.text = qualification;
    _startDateLabel.text=startDate;
    _endDateLabel.text=endDate;
        
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [institutionArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * title = nil;
    NSString *tit = [[NSString alloc] initWithFormat:@"%@",[institutionArray objectAtIndex:row] ];
    //NSLog(@"%@",tit);
    title = tit;
      return title;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSString *qualification = [[NSString alloc] initWithFormat:@"%@",[qualificationArray objectAtIndex:row] ];
    NSString * startDate = [[NSString alloc] initWithFormat:@"%@",[startDateArray objectAtIndex:row] ];
    NSString * endDate = [[NSString alloc] initWithFormat:@"%@",[endDateArray objectAtIndex:row] ];
    
    _qualificationLabel.text = qualification;
    _startDateLabel.text=startDate;
    _endDateLabel.text=endDate;
    
    
    
                           
                           
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)viewResultAction:(id)sender {
    
    qualifStr  = _qualificationLabel.text;
    mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ViewResultViewController *resultController = [mainStory instantiateViewControllerWithIdentifier:@"ViewResultViewController"];
//    
//    [self.navigationController pushViewController:resultController animated:YES];
}

+(NSString *) qualif{
    return qualifStr;
}
@end
