//
//  XPYTestViewController.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/27.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYTestViewController.h"

#import "XPYTestViewModel.h"

@interface XPYTestViewController ()

@property (nonatomic, strong) XPYTestViewModel *viewModel;

@end

@implementation XPYTestViewController

@dynamic viewModel;

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"测试" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:28];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self.viewModel.pushCommand execute:nil];
    }];
}

#pragma mark - Override methods
- (void)bindViewModel {
    [super bindViewModel];
    NSLog(@"bind test");
}

@end
