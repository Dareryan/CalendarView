//
//  EventDataStore.m
//  Month
//
//  Created by Nadia Yudina on 4/3/14.
//  Copyright (c) 2014 Nadia Yudina. All rights reserved.
//

#import "EventDataStore.h"
#import "Event.h"


@implementation EventDataStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        Event *tea = [[Event alloc]init];
        tea.date = @"2014-04-10 04:00:00 +0000";
        tea.time = @"16.30";
        tea.visitor = @"White Rabbit";
        tea.title = @"afternoon tea";
        
        Event *delivery = [[Event alloc]init];
        delivery.date = @"2014-04-10 04:00:00 +0000";
        delivery.time = @"10.00";
        delivery.visitor = @"Cat in a Hat";
        delivery.title = @"eat mice";
        
        Event *beer = [[Event alloc]init];
        beer.date =  @"2014-04-11 04:00:00 +0000";
        beer.time = @"all day";
        beer.visitor = @"Green Iguana";
        beer.title = @"eating leaves";
        
        _events = [NSArray arrayWithObjects: tea, beer, delivery, nil];
        
        //_eventsForCurrentDay = [[NSMutableArray alloc]init];
    }
    return self;
}


+(EventDataStore *) sharedDataStore
{
    static EventDataStore *_sharedDataStore = nil;
    
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedDataStore = [[self alloc] init];
    });
    
    return _sharedDataStore;
}
@end
