//
//  NSDate+DateHelpers.m
//  Task-C
//
//  Created by Skyler Tanner on 1/10/16.
//  Copyright © 2016 Skyler Tanner. All rights reserved.
//

#import "NSDate+DateHelpers.h"

@implementation NSDate (DateHelpers)

- (NSString *)stringValue {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    
    return [dateFormatter stringFromDate: self];
}

@end
