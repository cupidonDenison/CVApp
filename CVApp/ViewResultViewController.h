//
//  ViewResultViewController.h
//  CVApp
//
//  Created by Cupidon Denison on 12/3/14.
//  Copyright (c) 2014 Cupidon Denison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewResultViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *resultTableView;

@end
