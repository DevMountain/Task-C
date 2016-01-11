//
//  Task.m
//  Task-C
//
//  Created by Skyler Tanner on 1/9/16.
//  Copyright © 2016 Skyler Tanner. All rights reserved.
//

#import "Task.h"

@implementation Task

-(instancetype)initWithDueDate:(NSDate *)date isComplete:(NSNumber *)isComplete name:(NSString *)name notes:(NSString *)notes{
    self.due = date;
    self.isComplete = isComplete;
    self.name = name;
    self.notes = notes;
    return self;
}



@end

