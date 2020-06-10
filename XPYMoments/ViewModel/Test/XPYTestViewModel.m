//
//  XPYTestViewModel.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/27.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYTestViewModel.h"
#import "XPYTestPushViewModel.h"

@implementation XPYTestViewModel

- (void)initialize {
    self.pushCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        XPYTestPushViewModel *testPushViewModel = [[XPYTestPushViewModel alloc] initWithServices:self.services];
        [self.services pushViewModel:testPushViewModel animated:YES];
        return [RACSignal empty];
    }];
}

@end
