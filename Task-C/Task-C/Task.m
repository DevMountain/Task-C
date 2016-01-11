//
//  Task.m
//  Task-C
//
//  Created by Skyler Tanner on 1/9/16.
//  Copyright © 2016 Skyler Tanner. All rights reserved.
//

#import "Task.h"
#import "Stack.h"

@implementation Task

- (instancetype)initWithName:(NSString *)name due:(NSDate *)due notes:(NSString *)notes {
    
    NSManagedObjectContext *context = [Stack sharedInstance].managedObjectContext;
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:context];
    self = [self initWithEntity:entity insertIntoManagedObjectContext:context];
    
    self.due = due;
    self.isComplete = 0;
    self.name = name;
    self.notes = notes;
    return self;
}



@end

