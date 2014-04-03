//
//  TableViewController.m
//  Month
//
//  Created by Nadia Yudina on 4/3/14.
//  Copyright (c) 2014 Nadia Yudina. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = @"happy day";
    
    return cell;
}

@end
