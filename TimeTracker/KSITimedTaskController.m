//
//  KSITimedTaskController.m
//  TimeTracker
//
//  Created by Kevin Stewart on 7/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "KSITimedTaskController.h"
#import "KSITimedTask.h"

@interface KSITimedTaskController () {
    NSMutableArray *_internalTimedTasks;
}

@end

@implementation KSITimedTaskController

- (instancetype)init
{
    if (self = [super init]) {
        _internalTimedTasks = [[NSMutableArray alloc]init];
        
//        [self addTestData];
    }
    return self;
}

#pragma mark - Test Data
//- (void)addTestData
//{
//    KSITimedTask *aTimedTask = [[KSITimedTask alloc]initWithClient:@"DoorDash"
//                                               clientSummary:@"Fixed missing button to cancel order"
//                                           hourlyRateCharged:60
//                                         amountOfHoursWorked:10
//                                                       total:600];
//    [_internalTimedTasks addObject:aTimedTask];
//    // Adds Test data to mutable array of timed tasks
//}

#pragma mark - Convenience Accessors

- (NSArray<KSITimedTask *> *)timedTasks
{
    return _internalTimedTasks.copy;
}

- (NSUInteger)timedTaskCount
{
    return _internalTimedTasks.count;
}

- (KSITimedTask *)timedTasksAtIndex:(NSUInteger)index
{
    return [_internalTimedTasks objectAtIndex:index];
}

- (void)addTimedTasks:(KSITimedTask *)aTimedTask
{
    [_internalTimedTasks addObject:aTimedTask];
}

@end
