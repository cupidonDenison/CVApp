//
//  ExperienceViewController.m
//  CVApp
//
//  Created by Cupidon Denison on 11/7/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import "ExperienceViewController.h"

@interface ExperienceViewController ()

    @property(nonatomic,strong) NSString *documentPath,* documentPlistPath;
@end

@implementation ExperienceViewController

NSString *plistPath;
NSDictionary *plistRoot,*experienceDict;
NSArray *startDateArray,*endDateArray,*positionArray,*companyArray;
UIAlertView *alert ;

- (void)viewDidLoad {
    [super viewDidLoad];
    _positionTextField.delegate = self;
    _companyTextField.delegate=self;
    _startYearTextField.delegate=self;
    _endDateTextField.delegate = self;
    
    plistPath  =[[NSBundle mainBundle] pathForResource:@"CvAppPList" ofType:@"plist"];
    
    _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _documentPlistPath = [_documentPath stringByAppendingPathComponent:@"CvAppPList.plist"];
    
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager fileExistsAtPath:_documentPlistPath]){
        
        [manager copyItemAtPath:plistPath toPath:_documentPlistPath error:nil];
        
        
    }//end if statement

    plistRoot =[NSDictionary dictionaryWithContentsOfFile:_documentPlistPath];
    experienceDict = [plistRoot objectForKey:@"experience"];
    startDateArray =[experienceDict objectForKey:@"start"];
    endDateArray =[experienceDict objectForKey:@"end"];
    positionArray = [experienceDict objectForKey:@"position"];
    companyArray = [experienceDict objectForKey:@"company"];
    
    alert  = [[UIAlertView alloc] initWithTitle:@"Submission Successful" message:@"Want to add more?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 1:
            
            break;
            
        default:
            break;
    }
}



- (IBAction)saveAction:(id)sender {
    
    NSMutableDictionary *mutableRootDict =[NSMutableDictionary dictionaryWithDictionary:plistRoot];
    NSMutableDictionary *mutableExperienceDict = [NSMutableDictionary dictionaryWithDictionary:experienceDict];
    
    NSMutableArray *mutableStart,*mutableEnd,*mutableCompany,*mutablePosition;
    
    mutableStart =[NSMutableArray arrayWithArray:startDateArray];
    mutableEnd = [NSMutableArray arrayWithArray:endDateArray];
    mutablePosition = [NSMutableArray arrayWithArray:positionArray];
    mutableCompany =[NSMutableArray arrayWithArray:companyArray];
    
    [mutableCompany addObject:_companyTextField.text];
    [mutableEnd addObject:_endDateTextField.text];
    [mutablePosition addObject:_positionTextField.text];
    [mutableStart addObject:_startYearTextField.text];
    
    
    
    [mutableExperienceDict setObject:mutableCompany forKey:@"company"];
    [mutableExperienceDict setObject:mutablePosition forKey:@"position"];
    [mutableExperienceDict setObject:mutableStart forKey:@"start"];
    [mutableExperienceDict setObject:mutableEnd forKey:@"end"];
    
    
    
    [mutableRootDict setObject:mutableExperienceDict forKey:@"experience"];
    
    [mutableRootDict writeToFile:_documentPlistPath atomically:YES];
    
    NSLog(@" path %@",plistPath);
    
    [alert show];
    
    //[self.navigationController popViewControllerAnimated:YES];
                          
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
