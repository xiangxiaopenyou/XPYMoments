//
//  XPYBaseViewModel.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/27.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYBaseViewModel.h"
#import "XPYViewModelServices.h"

@interface XPYBaseViewModel ()

@property (nonatomic, strong) XPYViewModelServices *services;

@end

@implementation XPYBaseViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
}

@end
