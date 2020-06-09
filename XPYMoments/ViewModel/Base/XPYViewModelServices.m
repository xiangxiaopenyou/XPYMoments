//
//  XPYViewModelServices.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/29.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYViewModelServices.h"

@interface XPYViewModelServices ()

@property (nonatomic, strong) XPYNetworkService *networkService;

@end

@implementation XPYViewModelServices

- (instancetype)init {
    self = [super init];
    if (self) {
        self.networkService = [[XPYNetworkService alloc] init];
    }
    return self;
}

#pragma mark - XPYTransitionProtocol
- (void)dismissViewModelAnimated:(BOOL)animated completion:(XPYVoidHandler)completion {
}

- (void)popToRootViewModelAnimated:(BOOL)animated {
}

- (void)popToViewModel:(XPYBaseViewModel *)viewModel animated:(BOOL)animated {
}

- (void)popViewModelAnimated:(BOOL)animated {
}

- (void)presentViewModel:(XPYBaseViewModel *)viewModel animated:(BOOL)animated completion:(XPYVoidHandler)completion {
}

- (void)pushViewModel:(XPYBaseViewModel *)viewModel animated:(BOOL)animated {
}

@end
