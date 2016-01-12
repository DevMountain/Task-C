//
//  ButtonTableViewCell.m
//  Task-C
//
//  Created by Skyler Tanner on 1/11/16.
//  Copyright © 2016 Skyler Tanner. All rights reserved.
//

#import "ButtonTableViewCell.h"

@implementation ButtonTableViewCell


- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)buttonTapped:(id)sender {

    [self.delegate buttonCellButtonTapped:self];
}

- (void)updateButton:(BOOL)isComplete {
    
    if (isComplete) {
        [self.completeButton setImage:[UIImage imageNamed:@"complete"] forState:UIControlStateNormal];
    } else {
        [self.completeButton setImage:[UIImage imageNamed:@"incomplete"] forState:UIControlStateNormal];
    }
}

- (void)updateWithTask:(Task *)task {
    
    self.primaryLabel.text = task.name;
    [self updateButton:task.isComplete.boolValue];
}


@end

