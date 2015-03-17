//
//  ProfileViewController.m
//  CVApp
//
//  Created by Cupidon Denison on 11/7/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property(nonatomic,strong) Profile *infoPRofile;
@property(nonatomic,strong) NSBundle *mainBundle;
@property(nonatomic,strong) NSString *pListPath;
@property(nonatomic,strong) NSDictionary *myDict;
@property(nonatomic,strong) NSString *documentPath,* documentPlistPath;

@end

@implementation ProfileViewController






- (void)viewDidLoad {
    [super viewDidLoad];
    _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _documentPlistPath = [_documentPath stringByAppendingPathComponent:@"CvAppPList.plist"];
    
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    self.mainBundle = [NSBundle mainBundle];
    self.pListPath= [self.mainBundle pathForResource:@"CvAppPList" ofType:@"plist"];
    
    //check if file is in document directory if not coy file from main bundle to document directory
    
    if(![manager fileExistsAtPath:_documentPlistPath]){
        
        [manager copyItemAtPath:_pListPath toPath:_documentPlistPath error:nil];
        
        
    }//end if statement
    
    
    NSLog(@"%@",self.documentPlistPath);
    _nameTextField.delegate=self;
    _surnameTextField.delegate=self;
    _mobileTextField.delegate=self;
    _address1TextFeld.delegate=self;
    _address2TextField.delegate=self;
    _cityTextField.delegate=self;
    
    
    
    self.myDict = [NSDictionary dictionaryWithContentsOfFile:self.documentPlistPath];
    
   // NSLog(@" my dictonary = %@",_myDict);
    
}//end viewDidLoad

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)profileSave:(id)sender {
    
    _contentFromDictionary = [[NSMutableArray alloc] init];
    
    self.name=self.nameTextField.text;
    self.surname = self.surnameTextField.text;
    self.mobile = self.mobileTextField.text;
    self.address1 = self.address1TextFeld.text;
    self.address2= self.address2TextField.text;
    self.city = self.cityTextField.text;
  
    NSMutableArray *myRefineArray=[self.myDict objectForKey:@"profile"];
    NSMutableArray *refinedArray=[[NSMutableArray alloc]initWithArray:myRefineArray];
    [refinedArray replaceObjectAtIndex:0 withObject:self.nameTextField.text];
    [refinedArray replaceObjectAtIndex:1 withObject:self.surnameTextField.text];
    [refinedArray replaceObjectAtIndex:2 withObject:self.mobileTextField.text];
    [refinedArray replaceObjectAtIndex:3 withObject:self.address1TextFeld.text];
    [refinedArray replaceObjectAtIndex:4 withObject:self.address2TextField.text];
    [refinedArray replaceObjectAtIndex:5 withObject:self.cityTextField.text];
    
   // NSLog(@"%@",refinedArray);
    
    NSMutableDictionary *refineDict = [NSMutableDictionary dictionaryWithContentsOfFile:self.pListPath];
    [refineDict setObject:refinedArray forKey:@"profile"];
    NSLog(@"updated dictionary = %@",refineDict);
    
    [refineDict writeToFile:self.documentPlistPath atomically:YES];
    
  //  NSMutableDictionary *refineDict2 = [NSMutableDictionary dictionaryWithContentsOfFile:self.pListPath];
 //   NSLog(@"%@",refineDict2);
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}//end save profile methods

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


@end
