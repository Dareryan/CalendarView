//
//  Event.m
//  Month
//
//  Created by Nadia Yudina on 4/3/14.
//  Copyright (c) 2014 Nadia Yudina. All rights reserved.
//

#import "Event.h"

@implementation Event

- (NSString *)description
{
    return [NSString stringWithFormat:@"Event: %@ at: %@ with: %@", self.title, self.time, self.visitor];
}

@end
