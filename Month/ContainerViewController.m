//
//  ContainerViewController.m
//  Month
//
//  Created by Nadia Yudina on 4/2/14.
//  Copyright (c) 2014 Nadia Yudina. All rights reserved.
//

#import "ContainerViewController.h"
#import <TKInputView.h>
#import "EventDataStore.h"
#import "Event.h"
#import "ShowTableVCViewController.h"

@interface ContainerViewController ()

@property (strong, nonatomic) EventDataStore *dataStore;


@end

@implementation ContainerViewController



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.dataStore = [EventDataStore sharedDataStore];
    
    self.calendar = [[TKCalendarMonthView alloc] init];
    self.calendar.delegate = self;
    self.calendar.dataSource = self;
    
    [self.view addSubview:self.calendar];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TKCalendarMonthViewDelegate methods

- (void)calendarMonthView:(TKCalendarMonthView *)monthView didSelectDate:(NSDate *)d {
//	NSLog(@"calendarMonthView didSelectDate %@", d);
    
    self.dataStore.dateString = [d description];
    //NSLog(@"%@", self.dataStore.dateString);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ShowTableVCViewController *showVC = [storyboard instantiateViewControllerWithIdentifier:@"show"];
    
    showVC.tableView = [[TableView alloc]init];
    
    self.dataStore.eventsForCurrentDay = [[NSMutableArray alloc]init];
    
    for (Event *event in self.dataStore.events) {
        
        if ([event.date isEqualToString:[d description]])
        {
            [self.dataStore.eventsForCurrentDay addObject:event];
        }
    }
    
    //NSLog(@"%@", self.dataStore.eventsForCurrentDay);
    
    [showVC.tableView reloadData];
}

- (void)calendarMonthView:(TKCalendarMonthView *)monthView monthDidChange:(NSDate *)d {
	NSLog(@"calendarMonthView monthDidChange");
}


#pragma mark - TKCalendarMonthViewDataSource methods

- (NSArray*)calendarMonthView:(TKCalendarMonthView *)monthView marksFromDate:(NSDate *)startDate toDate:(NSDate *)lastDate {
	NSLog(@"calendarMonthView marksFromDate toDate");
	NSLog(@"Make sure to update 'data' variable to pull from CoreData, website, User Defaults, or some other source.");
	// When testing initially you will have to update the dates in this array so they are visible at the
	// time frame you are testing the code.
    
    NSMutableArray *data = [[NSMutableArray alloc]init];
    
    for (Event *event in self.dataStore.events) {
        [data addObject:event.date];
    }
	
    
	// Initialise empty marks array, this will be populated with TRUE/FALSE in order for each day a marker should be placed on.
	NSMutableArray *marks = [NSMutableArray array];
	
	// Initialise calendar to current type and set the timezone to never have daylight saving
	NSCalendar *cal = [NSCalendar currentCalendar];
	[cal setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
	
	// Construct DateComponents based on startDate so the iterating date can be created.
	// Its massively important to do this assigning via the NSCalendar and NSDateComponents because of daylight saving has been removed
	// with the timezone that was set above. If you just used "startDate" directly (ie, NSDate *date = startDate;) as the first
	// iterating date then times would go up and down based on daylight savings.
	NSDateComponents *comp = [cal components:(NSCalendarUnitMonth | NSCalendarUnitMinute| NSCalendarUnitYear |
                                              NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitSecond)
                                    fromDate:startDate];
    
	NSDate *d = [cal dateFromComponents:comp];
	
	// Init offset components to increment days in the loop by one each time
	NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
	[offsetComponents setDay:1];
	
    
	// for each date between start date and end date check if they exist in the data array
	while (YES) {
		// Is the date beyond the last date? If so, exit the loop.
		// NSOrderedDescending = the left value is greater than the right
		if ([d compare:lastDate] == NSOrderedDescending) {
			break;
		}
		
		// If the date is in the data array, add it to the marks array, else don't
		if ([data containsObject:[d description]]) {
			[marks addObject:[NSNumber numberWithBool:YES]];
		} else {
			[marks addObject:[NSNumber numberWithBool:NO]];
		}
		
		// Increment day using offset components (ie, 1 day in this instance)
		d = [cal dateByAddingComponents:offsetComponents toDate:d options:0];
	}
	
	return [NSArray arrayWithArray:marks];
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
