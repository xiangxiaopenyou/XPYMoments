//
//  XPYTableViewController.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/7/30.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYTableViewController.h"

#import "XPYTableView.h"
#import "XPYTableViewCell.h"

#import "XPYTableViewModel.h"

static NSString * const kXPYTableViewCellIdentifierKey = @"XPYTableViewCellIdentifier";

@interface XPYTableViewController ()

@property (nonatomic, strong) XPYTableView *tableView;
@property (nonatomic, strong, readonly) XPYTableViewModel *viewModel;

@end

@implementation XPYTableViewController

@dynamic viewModel;

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[XPYTableViewCell class] forCellReuseIdentifier:kXPYTableViewCellIdentifierKey];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.isMultiSections ? self.viewModel.dataSource.count : 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.isMultiSections ? [self.viewModel.dataSource[section] count] : self.viewModel.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XPYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([XPYTableViewCell class]) forIndexPath:indexPath];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - Getters
- (XPYTableView *)tableView {
    if (!_tableView) {
        _tableView = [[XPYTableView alloc] initWithFrame:CGRectZero style:self.viewModel.tableViewStyle];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
