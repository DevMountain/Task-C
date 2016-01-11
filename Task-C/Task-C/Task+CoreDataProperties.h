//
//  Task+CoreDataProperties.h
//  Task-C
//
//  Created by Skyler Tanner on 1/9/16.
//  Copyright © 2016 Skyler Tanner. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@interface Task (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *due;
@property (nullable, nonatomic, retain) NSNumber *isComplete;
@property (nullable, nonatomic, retain) NSString *notes;
@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
