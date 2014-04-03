//
//  TableViewController.m
//  Month
//
//  Created by Nadia Yudina on 4/3/14.
//  Copyright (c) 2014 Nadia Yudina. All rights reserved.
//

#import "TableViewController.h"
#import "Event.h"
#import "EventDataStore.h"
#import "ContainerViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) EventDataStore *dataStore;

@property (strong, nonatomic) ContainerViewController *containerVC;

@property (strong, nonatomic) NSMutableArray *eventsToShow;

@end

@implementation TableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataStore = [EventDataStore sharedDataStore];
    self.containerVC = [[ContainerViewController alloc]init];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.eventsToShow = [[NSMutableArray alloc]init];
    
    NSString *dateString = [self.containerVC.selectedDate description];
    
    for (Event *event in self.dataStore.events) {
        
        NSLog(@"%@", event.title);
        
    
        if ([event.date isEqualToString:dateString]) {

            [self.eventsToShow addObject:event];
        }
    }
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.eventsToShow count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Event *currentEvent = self.eventsToShow[indexPath.row];
    
    cell.textLabel.text = currentEvent.title;
    
    return cell;
}

@end
