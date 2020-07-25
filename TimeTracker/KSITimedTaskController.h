//
//  KSITimedTaskController.h
//  TimeTracker
//
//  Created by Kevin Stewart on 7/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSITimedTask.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSITimedTaskController : NSObject

@property (nonatomic, readonly, copy) NSArray<KSITimedTask *> *timedTasks;

@property (nonatomic, readonly) NSUInteger timedTaskCount;

- (KSITimedTask *)timedTasksAtIndex:(NSUInteger)index;

- (void)addTimedTasks:(KSITimedTask *)aTimedTask;

@end

NS_ASSUME_NONNULL_END
