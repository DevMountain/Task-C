//
//  TaskController.m
//  Task-C
//
//  Created by Skyler Tanner on 1/8/16.
//  Copyright © 2016 Skyler Tanner. All rights reserved.
//

#import "TaskController.h"
#import "Task.h"
#import "Stack.h"
@interface TaskController()

@property(strong, nonatomic)NSArray *tasks;
@property(strong, nonatomic)NSArray *completeTasks;
@property(strong, nonatomic)NSArray *incompleteTasks;
@end

@implementation TaskController

+ (TaskController *)sharedController {
    static TaskController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [TaskController new];
        sharedInstance.tasks = [NSArray new];
    });
    return sharedInstance;
}

- (NSArray *)tasks {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    NSError *error;
    
    NSArray *allTasks = [[Stack sharedInstance].managedObjectContext executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"Error fetching objects : %@", error.localizedDescription);
    }

    return allTasks;
}

- (NSArray *)completeTasks {
    NSMutableArray *tasksArray = [NSMutableArray new];
    for (Task *task in self.tasks) {
        if (task.isComplete.intValue == 1) {
            [tasksArray addObject:task];
        }
    }
    NSArray *tasks = tasksArray;
    return tasks;
}

- (NSArray *)incompleteTasks {
    NSMutableArray *tasksArray = [NSMutableArray new];
    for (Task *task in self.tasks) {
        if (task.isComplete.intValue == 0) {
            [tasksArray addObject:task];
        }
    }
    NSArray *tasks = tasksArray;
    return tasks;
}

- (void)addTask:(Task *)task {
    [self saveToPersistentStorage];
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
    NSError *error;
    
    [[Stack sharedInstance].managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"%@",error.localizedDescription);
    }
}



@end
