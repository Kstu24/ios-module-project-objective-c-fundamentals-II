//
//  KSITimedTask.m
//  TimeTracker
//
//  Created by Kevin Stewart on 7/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "KSITimedTask.h"

@implementation KSITimedTask

- (instancetype)initWithClient:(NSString *)aClient
                 clientSummary:(NSString *)aClientSummary
             hourlyRateCharged:(double)aHourlyRateCharged
           amountOfHoursWorked:(double)aAmountOfHoursWorked
                         total:(double)aTotal
{
    if (self = [super init]) {
        _client = aClient.copy;
        _clientSummary = aClientSummary.copy;
        _hourlyRateCharged = aHourlyRateCharged;
        _amountOfHoursWorked = aAmountOfHoursWorked;
        _total = aTotal;
    }
    return self;
}

@end
