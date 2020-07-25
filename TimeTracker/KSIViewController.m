//
//  KSIViewController.m
//  TimeTracker
//
//  Created by Kevin Stewart on 7/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "KSIViewController.h"
#import "KSITimedTaskController.h"
#import "KSITimedTask.h"

@interface KSIViewController () <UITableViewDataSource, UITableViewDelegate>

// Model Properties
@property (nonatomic) double total;
@property (nonatomic) NSString* client;
@property (nonatomic) NSString* clientSummary;
@property (nonatomic) double hourlyRate;
@property (nonatomic) double amountOfHoursWorked;
@property (nonatomic) KSITimedTaskController *ksiTimedTaskController;

// Private Outlets
@property (strong, nonatomic) IBOutlet UITextField *clientNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *clientSummaryTextField;
@property (strong, nonatomic) IBOutlet UITextField *hourlyrateTextField;
@property (strong, nonatomic) IBOutlet UITextField *amountOfHoursWorkedTextField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

// File Private Methods
- (void)calculateTotal;
- (void)updateViews;
- (void)saveTimedTask;

@end

@implementation KSIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.ksiTimedTaskController = [[KSITimedTaskController alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self calculateTotal];
    
}

#pragma mark - Methods

- (void)calculateTotal
{
    self.client = self.clientNameTextField.text;
    self.clientSummary = self.clientSummaryTextField.text;
    self.amountOfHoursWorked = self.amountOfHoursWorkedTextField.text.doubleValue;
    self.hourlyRate = self.hourlyrateTextField.text.doubleValue;
    self.total = self.hourlyRate * self.amountOfHoursWorked;
    
    [self updateViews];
}

- (void)updateViews
{
    self.clientNameTextField.text = self.client;
    self.clientSummaryTextField.text = self.clientSummary;
    self.hourlyrateTextField.text = [NSString localizedStringWithFormat:@"%.1f", self.hourlyRate];
    self.amountOfHoursWorkedTextField.text = [NSString localizedStringWithFormat:@"%.f", self.amountOfHoursWorked];
}

- (void)saveTimedTask
{
    [self.ksiTimedTaskController addTimedTasks:[[KSITimedTask alloc]initWithClient:_client
                                                                     clientSummary:self.clientSummary
                                                                 hourlyRateCharged:self.hourlyRate
                                                               amountOfHoursWorked:self.amountOfHoursWorked
                                                                             total:self.total]];
    [self.tableView reloadData];
}

#pragma mark - Actions

- (IBAction)logTimeButtonTapped:(id)sender {
    [self calculateTotal];
    [self saveTimedTask];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KSITimedTask *timedTask = [self.ksiTimedTaskController timedTasksAtIndex:indexPath.row];
    
    self.total = timedTask.total;
    self.amountOfHoursWorked = timedTask.amountOfHoursWorked;
    self.hourlyRate = timedTask.hourlyRateCharged;
    self.client = timedTask.client;
    self.clientSummary = timedTask.clientSummary;
    
    [self updateViews];
    [self calculateTotal];
}

#pragma mark - UITableViewDataSorurce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.ksiTimedTaskController.timedTaskCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimedTaskCell" forIndexPath:indexPath];

    KSITimedTask *timedTask = [self.ksiTimedTaskController timedTasksAtIndex:indexPath.row];

    cell.textLabel.text = timedTask.client;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%0.2f", timedTask.total];

    return cell;
}


@end

