//
//  ShowTableVCViewController.h
//  Month
//
//  Created by Nadia Yudina on 4/4/14.
//  Copyright (c) 2014 Nadia Yudina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableView.h"

@interface ShowTableVCViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (void)getTodaysEvents;

@end
