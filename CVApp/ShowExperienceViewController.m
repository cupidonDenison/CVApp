//
//  ShowExperienceViewController.m
//  CVApp
//
//  Created by Cupidon Denison on 11/19/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import "ShowExperienceViewController.h"

@interface ShowExperienceViewController ()
    @property(nonatomic,strong) NSString *documentPath,* documentPlistPath;
@end

@implementation ShowExperienceViewController
NSString *plistPath;
NSDictionary *plistRoot, * experienceDict;
NSArray *endArray,*startArray,*companyArray,*positionArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _companyUIPicker.delegate = self;
    _companyUIPicker.dataSource = self;
    _companyUIPicker.showsSelectionIndicator = YES;
    [self.view addSubview: _companyUIPicker];
    
    plistPath =[[NSBundle mainBundle] pathForResource:@"CvAppPList" ofType:@"plist"];
    
    _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _documentPlistPath = [_documentPath stringByAppendingPathComponent:@"CvAppPList.plist"];
    
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager fileExistsAtPath:_documentPlistPath]){
        
        [manager copyItemAtPath:plistPath toPath:_documentPlistPath error:nil];
        
        
    }//end if statement

    plistRoot =[[NSDictionary alloc] initWithContentsOfFile:_documentPlistPath];
    
    experienceDict = [plistRoot objectForKey:@"experience"];
    
    companyArray = [experienceDict objectForKey:@"company"];
    positionArray  =[experienceDict objectForKey:@"position"];
    endArray = [experienceDict objectForKey:@"end"];
    startArray  = [experienceDict objectForKey:@"start"];
    
    //display first information from plist if there is data
    
    NSLog(@"Company count = %@",companyArray);
    
    if([companyArray count] > 0){
        
        NSString *position = [positionArray objectAtIndex:0];
        NSString *end = [endArray objectAtIndex:0];
        NSString *start = [startArray objectAtIndex:0];
        
        _positionUILsbel.text = position;
        _endYearULabel.text = end;
        _startYearUILabel.text = start;
        
    }//end if statement

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [companyArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * company;
    
    company = [companyArray objectAtIndex:row];
    
    return company;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    _positionUILsbel.text=[positionArray objectAtIndex:row];
    _startYearUILabel.text = [startArray objectAtIndex:row];
    _endYearULabel.text = [endArray objectAtIndex:row];
    
    
}



@end
