//
//  SkillsViewController.m
//  CVApp
//
//  Created by Cupidon Denison on 11/7/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import "SkillsViewController.h"

@interface SkillsViewController ()
@property(nonatomic,strong) NSString *documentPath,* documentPlistPath;


@end

@implementation SkillsViewController

NSString *plistPath;
NSDictionary *plistRoot, *skillsRoot;
NSArray *areaArray,*descriptionArray;

UIAlertView * alert;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    plistPath = [[NSBundle mainBundle] pathForResource:@"CvAppPList" ofType:@"plist"];
    
    _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _documentPlistPath = [_documentPath stringByAppendingPathComponent:@"CvAppPList.plist"];
    
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager fileExistsAtPath:_documentPlistPath]){
        
        [manager copyItemAtPath:plistPath toPath:_documentPlistPath error:nil];
        
        
    }//end if statement

   
    
    
    plistRoot = [NSDictionary dictionaryWithContentsOfFile:_documentPlistPath];
    skillsRoot = [plistRoot objectForKey:@"skills"];
    areaArray = [skillsRoot objectForKey:@"area"];
    descriptionArray = [skillsRoot objectForKey:@"description"];
    
    alert = [[UIAlertView alloc] initWithTitle:@"submission successful" message:@"Want to add more?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"YES", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch(buttonIndex) {
        case 0: //"No" pressed
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 1: //"Yes" pressed
            //here you pop the viewController
            //[self.navigationController popViewControllerAnimated:YES];
            break;
    }
}



- (IBAction)saveAction:(id)sender {
    
    NSMutableDictionary * rootMute, * skillsMute;
    NSMutableArray * areaMuteArray, * descriptionMuteArray;
    
    rootMute = [NSMutableDictionary dictionaryWithDictionary:plistRoot];
    skillsMute = [NSMutableDictionary dictionaryWithDictionary:skillsRoot];
    areaMuteArray = [NSMutableArray arrayWithArray:areaArray];
    descriptionMuteArray = [NSMutableArray arrayWithArray:descriptionArray];
    
    
    
    [descriptionMuteArray addObject:_descriptionTextView.text];
    [areaMuteArray addObject:_areaTextField.text];
    
    [skillsMute setObject:descriptionMuteArray forKey:@"description"];
    [skillsMute setObject:areaMuteArray forKey:@"area"];
    
    // NSLog(@" root mu %@",rootMute);
    
    [rootMute  setObject:skillsMute  forKey:@"skills"];
    
    
    
    [rootMute writeToFile:_documentPlistPath atomically:YES];
    
    [alert show];
    
    
    }
@end
