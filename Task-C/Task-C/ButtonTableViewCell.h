//
//  ButtonTableViewCell.h
//  Task-C
//
//  Created by Skyler Tanner on 1/11/16.
//  Copyright © 2016 Skyler Tanner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@protocol ButtonTableViewCellDelegate;

@interface ButtonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *primaryLabel;
@property (weak, nonatomic) IBOutlet UIButton *completeButton;
@property (weak, nonatomic) id<ButtonTableViewCellDelegate> delegate;

- (void)updateWithTask:(Task *)task;
- (void)updateButton:(BOOL)isComplete;
@end

@protocol ButtonTableViewCellDelegate
- (void)buttonCellButtonTapped:(ButtonTableViewCell *)sender;
@end

