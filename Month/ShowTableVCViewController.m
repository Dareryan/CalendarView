//
//  ShowTableVCViewController.m
//  Month
//
//  Created by Nadia Yudina on 4/4/14.
//  Copyright (c) 2014 Nadia Yudina. All rights reserved.
//

#import "ShowTableVCViewController.h"
#import "EventDataStore.h"

@interface ShowTableVCViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) EventDataStore *dataStore;

@end

@implementation ShowTableVCViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.dataStore = [EventDataStore sharedDataStore];
    
    //NSLog(@"%@", self.dataStore.eventsForCurrentDay);
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //Event *currentEvent = self.dataStore.eventsForCurrentDay[indexPath.row];
    
    cell.textLabel.text = @"happy";
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
