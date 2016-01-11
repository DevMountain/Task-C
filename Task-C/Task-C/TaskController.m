//
//  TaskController.m
//  Task-C
//
//  Created by Skyler Tanner on 1/8/16.
//  Copyright © 2016 Skyler Tanner. All rights reserved.
//

#import "TaskController.h"
#import "Stack.h"
@interface TaskController()

@property(strong, nonatomic)NSArray *tasks;
@property(strong, nonatomic)NSArray *completeTasks;
@property(strong, nonatomic)NSArray *incompleteTasks;
@end

@implementation TaskController

+ (TaskController *)sharedInstance {
    static TaskController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [TaskController new];
    });
    return sharedInstance;
}

- (NSArray *)tasks {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    
    NSArray *tasksArray = [[Stack sharedInstance].managedObjectContext executeFetchRequest:request
                                                               error:nil];
    return tasksArray;
}

- (NSArray *)completeTasks {
    NSMutableArray *tasksArray;
    for (Task *task in self.tasks) {
        if (task.isComplete.intValue == 1) {
            [tasksArray addObject:task];
        }
    }
    
    return tasksArray;
}

- (NSArray *)incompleteTasks {
    NSMutableArray *tasksArray;
    for (Task *task in self.tasks) {
        if (task.isComplete.intValue == 0) {
            [tasksArray addObject:task];
        }
    }
    
    return tasksArray;
}

- (Task *)addTask {
    Task *task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    [self saveToPersistentStorage];
    return task;
}

- (void)removeTask:(Task *)taskToRemove
{
    [taskToRemove.managedObjectContext deleteObject:taskToRemove];
    [self saveToPersistentStorage];
}

//
//// MARK: - Persistence
//
- (void)saveToPersistentStorage {
    [[Stack sharedInstance].managedObjectContext save:nil];
}



@end
