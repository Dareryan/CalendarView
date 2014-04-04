//
//  TableView.m
//  Month
//
//  Created by Nadia Yudina on 4/3/14.
//  Copyright (c) 2014 Nadia Yudina. All rights reserved.
//

#import "TableView.h"
#import "EventDataStore.h"
#import "Event.h"

@interface TableView ()

@property (strong,  nonatomic) EventDataStore *dataStore;


@end

@implementation TableView


- (void)reloadData
{
    self.dataStore = [EventDataStore sharedDataStore];
    
    [super reloadData];
    
    NSLog(@"%@", self.dataStore.eventsForCurrentDay);
    
    
    //NSLog(@"%@", self.dataStore.dateString);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
