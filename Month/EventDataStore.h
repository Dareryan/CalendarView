//
//  EventDataStore.h
//  Month
//
//  Created by Nadia Yudina on 4/3/14.
//  Copyright (c) 2014 Nadia Yudina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventDataStore : NSObject

@property (strong, nonatomic) NSArray *events;//of event objects

+(EventDataStore *) sharedDataStore;

@end
