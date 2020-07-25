//
//  KSITimedTask.h
//  TimeTracker
//
//  Created by Kevin Stewart on 7/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSITimedTask : NSObject

@property (nonatomic, readonly, copy) NSString *client;
@property (nonatomic, readonly, copy) NSString *clientSummary;
@property (nonatomic, readonly) double hourlyRateCharged;
@property (nonatomic, readonly) double amountOfHoursWorked;
@property (nonatomic, readonly) double total;

- (instancetype)initWithClient:(NSString *)aClient
                 clientSummary:(NSString *)aClientSummary
             hourlyRateCharged:(double)aHourlyRateCharged
           amountOfHoursWorked:(double)aAmountOfHoursWorked
                         total:(double)aTotal;


@end

NS_ASSUME_NONNULL_END
