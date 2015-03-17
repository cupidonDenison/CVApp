//
//  ViewResultViewController.m
//  CVApp
//
//  Created by Cupidon Denison on 12/3/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import "ViewResultViewController.h"
#import "ShowEducationViewController.h"
#import "MMResultTableViewCell.h"

@interface ViewResultViewController ()
    @property(nonatomic,strong) NSString *documentPath,* documentPlistPath;
@end

@implementation ViewResultViewController

NSString *qualification , *plistPath;
NSDictionary *rootDict,*resultDict,*qualificationDict;
NSArray * subjectArr, *gradeArr;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    plistPath = [[NSBundle mainBundle] pathForResource:@"CvAppPList" ofType:@"plist"];
    
    _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _documentPlistPath = [_documentPath stringByAppendingPathComponent:@"CvAppPList.plist"];
    
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager fileExistsAtPath:_documentPlistPath]){
        
        [manager copyItemAtPath:plistPath toPath:_documentPlistPath error:nil];
        
        
    }//end if statement

    
    rootDict = [NSDictionary dictionaryWithContentsOfFile:_documentPlistPath];
    
    resultDict = [rootDict objectForKey:@"result"];
    
    
    
    qualification = [ShowEducationViewController qualif];
    NSLog(@"qualification  = %@",qualification);
    
    qualificationDict = [resultDict objectForKey:qualification];
    subjectArr = [qualificationDict objectForKey:@"subject"];
    gradeArr = [qualificationDict objectForKey:@"grade"];
    
    NSLog(@"subject array = %@",subjectArr);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [subjectArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"resultRow";
//    static NSString *cellIdentifier = @"gradeTableCell";
    
    
    MMResultTableViewCell *myCell=[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
  // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
   
    
    
    NSString * sub = [subjectArr objectAtIndex:indexPath.row];
    NSString *grad = [gradeArr objectAtIndexedSubscript:indexPath.row];
    
//    NSString * cellValue =[NSString stringWithFormat:@"%@ \t %@",sub,grad];
//    cell.textLabel.text = cellValue;
    
    
    myCell.resultLabel.text = sub;
    myCell.gradeLABEL.text = grad;
    
//    cell.textLabel.text = [gradeArr objectAtIndexedSubscript:indexPath.row];
//    cell.imageView.image = [UIImage imageNamed:@"creme_brelee.jpg"];
    
    return myCell;
}

@end
