//
//  EducationViewController.m
//  CVApp
//
//  Created by Cupidon Denison on 11/6/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import "EducationViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AddResultViewController.h"

@interface EducationViewController ()
    @property(nonatomic,strong) NSString *documentPath,* documentPlistPath;
@end

@implementation EducationViewController

NSString *institution,* qualification,*startDate,*endDate;
NSString *plistPath;
NSDictionary *plistRoot, *educationDict;
NSArray *startYearArray,*endYearArray,*institutionArray,*qualificationArray;





- (void)viewDidLoad {
    [super viewDidLoad];
    _institutionTextField.delegate=self;
    _qualificationTextField.delegate= self;
    _startYearTextField.delegate=self;
    _endYearTextField.delegate = self;
    
    plistPath = [[NSBundle mainBundle] pathForResource:@"CvAppPList" ofType:@"plist"];
    
    
    _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _documentPlistPath = [_documentPath stringByAppendingPathComponent:@"CvAppPList.plist"];
    
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager fileExistsAtPath:_documentPlistPath]){
        
        [manager copyItemAtPath:plistPath toPath:_documentPlistPath error:nil];
        
        
    }//end if statement

    
   plistRoot =[NSDictionary dictionaryWithContentsOfFile:_documentPlistPath];
    
    educationDict = [plistRoot objectForKey:@"education"];
    startYearArray = [educationDict objectForKey:@"start"];
    endYearArray =[educationDict objectForKey:@"end"];
    institutionArray =[educationDict objectForKey:@"institution"];
    qualificationArray=[educationDict objectForKey:@"qualification"];
    
//    _endYearTextField.layer.cornerRadius=8.0f;
//    _endYearTextField.layer.masksToBounds=YES;
//    _endYearTextField.layer.borderColor=[[UIColor redColor]CGColor];
//    _endYearTextField.layer.borderWidth= 2.0f
    
    
    //get origin of viewcotroller
    
//    UIStoryboard * mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    
//    EducationViewController * educationController = [mainStory instantiateViewControllerWithIdentifier:@"EducationViewController"];
//    
    CGPoint point = [_endYearTextField convertPoint:_endYearTextField.frame.origin toView:self.view];
    
    CGFloat width = _endYearTextField.frame.size.width;
    
   // UIViewController * view = self;
    
    //CGPoint point2 = [educationController.view convertPoint:educationController.view.frame.origin toView:self.view ];
    
    NSLog(@"point %@ size =  %f",NSStringFromCGPoint(point),width);
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








- (IBAction)backAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)ActionSave:(id)sender {
    
    NSMutableArray *startMutable, *endMutable, *institutionMutable,*qualificationMutable;
    NSMutableDictionary *plistMutableRoot,*educationMutable;
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Submission Successful"
//                                                    message:@"...Do you want to add more?..."
//                                                   delegate:self
//                                          cancelButtonTitle:@"No"
//                                          otherButtonTitles:@"Yes", nil];
    
    //[alert show];
    
    startMutable = [[NSMutableArray alloc] initWithArray:startYearArray];
    endMutable =[[NSMutableArray alloc] initWithArray:endYearArray];
    institutionMutable = [[NSMutableArray alloc] initWithArray:institutionArray];
    qualificationMutable =[[NSMutableArray alloc] initWithArray:qualificationArray];
    
    [startMutable addObject:_startYearTextField.text];
    [endMutable addObject:_endYearTextField.text];
    [institutionMutable addObject:_institutionTextField.text];
    [qualificationMutable addObject:_qualificationTextField.text];
    
    educationMutable =[NSMutableDictionary dictionaryWithDictionary:educationDict];
    plistMutableRoot = [NSMutableDictionary dictionaryWithDictionary:plistRoot];
    
    [educationMutable setObject:startMutable forKey:@"start"];
    [educationMutable setObject:endMutable forKey:@"end"];
    [educationMutable setObject:institutionMutable forKey:@"institution"];
    [educationMutable setObject:qualificationMutable forKey:@"qualification"];
    
    [plistMutableRoot setObject:educationMutable forKey:@"education"];
    
    [plistMutableRoot writeToFile:_documentPlistPath atomically:YES];
    
    NSLog(@"Plist content %@",plistMutableRoot);
    [self.navigationController popViewControllerAnimated:YES];
    
    //[alert show];

    
    //[self.navigationController popViewControllerAnimated:YES];
    }

- (IBAction)addResultAction:(id)sender {
    
    UIStoryboard *mainStory= [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    AddResultViewController * addResultController = [mainStory instantiateViewControllerWithIdentifier:@"AddResultViewController"];
    
    [self.navigationController pushViewController:addResultController animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch(buttonIndex) {
        case 0: //"No" pressed
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 1: //"Yes" pressed
            _institutionTextField.text= nil;
            _qualificationTextField.text=nil;
            _endYearTextField.text=nil;
            _startYearTextField.text = nil;
            break;
    }
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
@end
