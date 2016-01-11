//
//  Task.h
//  Task-C
//
//  Created by Skyler Tanner on 1/9/16.
//  Copyright © 2016 Skyler Tanner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSManagedObject

- (instancetype)initWithName:(NSString *)name due:(NSDate *)due notes:(NSString *)notes;

@end

NS_ASSUME_NONNULL_END

#import "Task+CoreDataProperties.h"

