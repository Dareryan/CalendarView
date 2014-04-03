//
//  ContainerViewController.h
//  Month
//
//  Created by Nadia Yudina on 4/2/14.
//  Copyright (c) 2014 Nadia Yudina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TapkuLibrary/TapkuLibrary.h>

@interface ContainerViewController : UIViewController <TKCalendarMonthViewDelegate,TKCalendarMonthViewDataSource>

@property (strong, nonatomic) TKCalendarMonthView *calendar;

@property (strong, nonatomic) NSDate *selectedDate;

@end
