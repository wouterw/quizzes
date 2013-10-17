//
//  AnswerListViewController.m
//  Quizzes
//
//  Created by Wouter Willaert on 12/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "AnswerTableViewController.h"

static NSString *CellIdentifier = @"Cell";

@implementation AnswerTableViewController

#pragma mark - View Lifecycle

- (void)loadView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];

    self.view = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = self.options[indexPath.row];
    
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate answerViewController:self didSelectAnswerAtIndex:indexPath.row];
    
    NSString *option = self.options[indexPath.row];
    NSLog(@"Option selected: %@.", option);
}

@end
