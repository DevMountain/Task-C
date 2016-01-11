//
//  TaskDetailTableViewController.m
//  Task-C
//
//  Created by Skyler Tanner on 1/8/16.
//  Copyright © 2016 Skyler Tanner. All rights reserved.
//

#import "TaskDetailTableViewController.h"
#import "Task.h"
#import "TaskController.h"
#import "NSDate+DateHelpers.h"

@interface TaskDetailTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *taskDueTextField;
@property (weak, nonatomic) IBOutlet UITextView *taskNotesTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDatePicker;
@property (strong, nonatomic)NSDate *dueDateValue;

@end

@implementation TaskDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.taskDueTextField.inputView = self.dueDatePicker;
    
    if (self.task) {
        [self updateWithTask: self.task];
    }
    
}
- (IBAction)cancelButtonTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveButtonTapped:(id)sender {
    [self updateTask];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)datePickerValueChanged:(UIDatePicker *)sender {
    
    self.taskDueTextField.text = [sender.date stringValue];
    self.dueDateValue = sender.date;
}

- (IBAction)userTappedView:(id)sender {
    [self.taskNameTextField resignFirstResponder];
    [self.taskDueTextField resignFirstResponder];
    [self.taskNotesTextView resignFirstResponder];
}

- (void)updateTask {
    NSString *name = self.taskNameTextField.text;
    NSDate *due = self.dueDateValue;
    NSString *notes = self.taskNotesTextView.text;
    
    if (self.task) {
        self.task.name = name;
        self.task.due = due;
        self.task.notes = notes;
        [[TaskController sharedInstance] saveToPersistentStorage];
      
    } else {
        Task *newTask = [[Task alloc]initWithName:name due:due notes:notes];
        [[TaskController sharedInstance] addTask:newTask];
    }

}

- (void)updateWithTask:(Task *)task {
    
    self.title = self.task.name;
    self.taskNameTextField.text = task.name;
    self.taskDueTextField.text = [task.due stringValue];
    self.taskNotesTextView.text = task.notes;
    
}

@end
