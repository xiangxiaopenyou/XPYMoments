//
//  XPYTestPushViewController.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/10.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYTestPushViewController.h"

@interface XPYTestPushViewController ()

@end

@implementation XPYTestPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] init];
    label.text = @"pushed";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

@end
