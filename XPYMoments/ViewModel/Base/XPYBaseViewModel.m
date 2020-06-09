//
//  XPYBaseViewModel.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/27.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYBaseViewModel.h"

@interface XPYBaseViewModel ()

@property (nonatomic, strong) XPYViewModelServices *services;

@end

@implementation XPYBaseViewModel
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    // 保证每次初始化都调用initialize方法
    XPYBaseViewModel *viewModel = [super allocWithZone:zone];
    @weakify(viewModel)
    [[viewModel rac_signalForSelector:@selector(initWithServices:)] subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(viewModel)
        [viewModel initialize];
    }];
    return viewModel;
}

- (instancetype)initWithServices:(XPYViewModelServices *)services {
    self = [super init];
    if (self) {
        self.services = services;
    }
    return self;
}

- (void)initialize {
}

@end
