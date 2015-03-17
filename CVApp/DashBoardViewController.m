//
//  DashBoardViewController.m
//  CVApp
//
//  Created by Cupidon Denison on 11/7/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import "DashBoardViewController.h"
#import "SkillsViewController.h"
#import "ProfileViewController.h"
#import "EducationViewController.h"
#import "ExperienceViewController.h"
#import "SkillsViewController.h"
#import "InfoViewController.h"
@interface DashBoardViewController ()

@end

@implementation DashBoardViewController

UIStoryboard *mainStory;

- (void)viewDidLoad {
    [super viewDidLoad];
     mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)skillAction:(id)sender {
    SkillsViewController *skillController = [mainStory instantiateViewControllerWithIdentifier:@"SkillsViewController"];
    [self.navigationController pushViewController:skillController animated:YES];
    
}

- (IBAction)experiencAction:(id)sender{
    ExperienceViewController *experienceController = [mainStory instantiateViewControllerWithIdentifier:@"ExperienceViewController"];
    [self.navigationController pushViewController:experienceController animated:YES];
    
}

- (IBAction)educationAction:(id)sender {
    EducationViewController *educationController = [mainStory instantiateViewControllerWithIdentifier:@"EducationViewController"];
    [self.navigationController pushViewController:educationController animated:YES];
    
}

- (IBAction)actionProfile:(id)sender {
    
    
    ProfileViewController *proflieView = [mainStory instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    
    [self.navigationController pushViewController:proflieView animated:YES];
    
    
}

- (IBAction)viewAction:(id)sender {
    InfoViewController *proflieView = [mainStory instantiateViewControllerWithIdentifier:@"InfoViewController"];
    
    [self.navigationController pushViewController:proflieView animated:YES];

}
@end
