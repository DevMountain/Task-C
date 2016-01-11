//
//  TaskController.h
//  Task-C
//
//  Created by Skyler Tanner on 1/8/16.
//  Copyright © 2016 Skyler Tanner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface TaskController : NSObject

@property(strong, nonatomic, readonly)NSArray *tasks;
@property(strong, nonatomic, readonly)NSArray *completeTasks;
@property(strong, nonatomic, readonly)NSArray *incompleteTasks;

+ (TaskController*)sharedInstance;
- (void)addTask:(Task *)task;
- (void)removeTask:(Task *)taskToRemove;
- (void)saveToPersistentStorage;

@end
