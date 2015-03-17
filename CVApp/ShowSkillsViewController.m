//
//  ShowSkillsViewController.m
//  CVApp
//
//  Created by Cupidon Denison on 11/19/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import "ShowSkillsViewController.h"

@interface ShowSkillsViewController ()

    @property(nonatomic,strong) NSString *documentPath,* documentPlistPath;
@end

@implementation ShowSkillsViewController

NSString * plistPath;
NSDictionary  * plistRoot, * skillsDict;
NSArray *areaArray , * descriptionArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _areaUIPickerView.delegate = self;
    _areaUIPickerView.dataSource = self;
    _areaUIPickerView.showsSelectionIndicator = YES;
    [self.view addSubview:_areaUIPickerView];
    
    plistPath = [[NSBundle mainBundle] pathForResource:@"CvAppPList" ofType:@"plist" ];
    
    _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _documentPlistPath = [_documentPath stringByAppendingPathComponent:@"CvAppPList.plist"];
    
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager fileExistsAtPath:_documentPlistPath]){
        
        [manager copyItemAtPath:plistPath toPath:_documentPlistPath error:nil];
        
        
    }//end if statement

    
    plistRoot = [NSDictionary dictionaryWithContentsOfFile:_documentPlistPath];
    
    skillsDict = [plistRoot objectForKey:@"skills"];
    
    areaArray = [skillsDict objectForKey:@"area"];
    descriptionArray = [skillsDict objectForKey:@"description"];
    
    //check if skills dictionary has content
    
    if([areaArray count] > 0){
        _descriptionTextView.text = [descriptionArray objectAtIndex:0];
    }//end if statement
   
 
    //NSLog(@" area count = %li",[areaArray count]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [areaArray count];
   // return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * area;
    
    area = [areaArray objectAtIndex:row];
    
    return area;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
   
    _descriptionTextView.text = [descriptionArray objectAtIndex:row];
    
}





@end
