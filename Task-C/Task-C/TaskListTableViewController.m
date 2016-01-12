//
//  TaskListTableViewController.m
//  Task-C
//
//  Created by Skyler Tanner on 1/8/16.
//  Copyright © 2016 Skyler Tanner. All rights reserved.
//

#import "TaskListTableViewController.h"
#import "TaskController.h"
#import "TaskDetailTableViewController.h"
#import "ButtonTableViewCell.h"

@interface TaskListTableViewController () <ButtonTableViewCellDelegate>
@property(strong, nonatomic)NSMutableArray *tasksArray;
@end

@implementation TaskListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.tasksArray = [[TaskController sharedController].incompleteTasks mutableCopy];
    [self.tableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tasksArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell" forIndexPath:indexPath];
    
    Task *task = self.tasksArray[indexPath.row];
    cell.primaryLabel.text = task.name;
    [cell updateWithTask:task];
    cell.delegate = self;
    
    
    return cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
    
        Task *taskToDelete = self.tasksArray[indexPath.row];
        [self.tasksArray removeObject:taskToDelete];
        [[TaskController sharedController] removeTask:taskToDelete];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"toViewTask"]) {
        TaskDetailTableViewController *detailView = [segue destinationViewController];
        Task *task = self.tasksArray[[self.tableView indexPathForSelectedRow].row];
        
        detailView.task = task;
    }
    
}


-(void)buttonCellButtonTapped:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    Task *task = self.tasksArray[indexPath.row];
    task.isComplete = [NSNumber numberWithBool:![task.isComplete boolValue]];
    
    [[TaskController sharedController] saveToPersistentStorage];
    
    self.tasksArray = [[TaskController sharedController].incompleteTasks mutableCopy];
    [self.tableView reloadData];
}

@end
