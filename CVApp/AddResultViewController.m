//
//  AddResultViewController.m
//  CVApp
//
//  Created by Cupidon Denison on 11/21/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import "AddResultViewController.h"

@interface AddResultViewController ()
    @property(nonatomic,strong) NSString *documentPath,* documentPlistPath;
@end

@implementation AddResultViewController{
    
    NSString *plistPath, * selectedQualification;
    NSDictionary *plistRoot, * resultDict,*educationDict;
    NSArray *qualificationArray;

}


- (void)viewDidLoad {
    
    [super viewDidLoad];

    _qualificationUIPickerView.delegate = self;
    _qualificationUIPickerView.dataSource=self;
    _qualificationUIPickerView.showsSelectionIndicator=YES;
    [self.view addSubview:_qualificationUIPickerView];
    
    plistPath=[[NSBundle mainBundle] pathForResource:@"CvAppPList" ofType:@"plist"];
    
    _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _documentPlistPath = [_documentPath stringByAppendingPathComponent:@"CvAppPList.plist"];
    
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager fileExistsAtPath:_documentPlistPath]){
        
        [manager copyItemAtPath:plistPath toPath:_documentPlistPath error:nil];
        
        
    }//end if statement

    
    plistRoot = [NSDictionary dictionaryWithContentsOfFile:_documentPlistPath];
    
    educationDict = [plistRoot objectForKey:@"education"];
    resultDict = [plistRoot objectForKey:@"result"];
    qualificationArray = [educationDict objectForKey:@"qualification"];
    
    NSLog(@"%@",qualificationArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [qualificationArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * qualification;
    // NSLog(@"%@",qualificationArray);
    
    qualification = [qualificationArray objectAtIndex:row];
    
    return qualification;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    selectedQualification = [qualificationArray objectAtIndex:row];
    
    
}



- (IBAction)saveAction:(id)sender {
    
    //NSMutableArray * qualificationMutable;
    NSMutableDictionary * rootMutable , * resultMutable , *selectedQualificationDict;
    NSMutableArray * subjectArray, *gradeArray;
   // selectedQualification = [NSString stringWithFormat:@"%@",selectedQualification];
    NSLog(@" selected qualification %@",selectedQualification);
    
//    qualificationMutable = [NSMutableArray arrayWithArray:qualificationArray];
    
    plistPath=[[NSBundle mainBundle] pathForResource:@"CvAppPList" ofType:@"plist"];
    
    _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _documentPlistPath = [_documentPath stringByAppendingPathComponent:@"CvAppPList.plist"];
    
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager fileExistsAtPath:_documentPlistPath]){
        
        [manager copyItemAtPath:plistPath toPath:_documentPlistPath error:nil];
        
        
    }//end if statement

    
    plistRoot = [NSDictionary dictionaryWithContentsOfFile:_documentPlistPath];
   
    resultMutable = [NSMutableDictionary dictionaryWithDictionary:resultDict];
    rootMutable = [NSMutableDictionary dictionaryWithDictionary:plistRoot];
    
    NSMutableString *selectedQualificationMutable = [[NSMutableString alloc]  initWithString:selectedQualification];
    
    selectedQualificationMutable = [NSMutableString stringWithFormat:@"\'%@\'",selectedQualification];
    
    
    //if key exist
    if([resultMutable objectForKey:selectedQualification]){
        
        NSDictionary * qualifDict = [resultMutable objectForKey:selectedQualification];
        selectedQualificationDict = [NSMutableDictionary dictionaryWithDictionary:qualifDict];
        NSArray *sub = [selectedQualificationDict objectForKey:@"subject"];
        NSArray *grade = [selectedQualificationDict objectForKey:@"grade"];
        
        subjectArray = [NSMutableArray arrayWithArray:sub];
        gradeArray = [NSMutableArray arrayWithArray:grade];
        
        //int resultCount = [subjectArray count];
        [subjectArray addObject:_subject1TextField.text];
        [gradeArray addObject:_grade1TextField.text];
        
        [selectedQualificationDict setObject:subjectArray forKey:@"subject"];
        [selectedQualificationDict setObject:gradeArray forKey:@"grade"];
        
        [resultMutable setObject:selectedQualificationDict forKey:selectedQualification];
        [rootMutable setObject:resultMutable forKey:@"result"];
        
        [rootMutable writeToFile:_documentPlistPath atomically:YES];
        NSLog(@" root list  = %@",rootMutable);
        
        [self.navigationController popToRootViewControllerAnimated:YES];

        
    }else{  //if key does not exist
        
        selectedQualificationDict = [[NSMutableDictionary alloc] init];
        
        
        
        subjectArray = [[NSMutableArray alloc] initWithObjects:_subject1TextField.text, nil ];
        gradeArray = [[NSMutableArray alloc] initWithObjects:_grade1TextField.text, nil ];
        
        [selectedQualificationDict setObject:subjectArray forKey:@"subject"];
        [selectedQualificationDict setObject:gradeArray forKey:@"grade"];
        
        [resultMutable setObject:selectedQualificationDict forKey:selectedQualification];
        [rootMutable setObject:resultMutable forKey:@"result"];
        
        [rootMutable writeToFile:_documentPlistPath atomically:YES];
        
                [self.navigationController popToRootViewControllerAnimated:YES];
        NSLog(@" root list  = %@",rootMutable);
        
    }//end if-else statement
    
    
    
}//end saveAction
@end
