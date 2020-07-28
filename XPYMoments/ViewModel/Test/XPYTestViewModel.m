//
//  XPYTestViewModel.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/27.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYTestViewModel.h"
#import "XPYTestPushViewModel.h"

#import "XPYUserModel.h"
#import "XPYArchiveManager.h"

@interface XPYTestViewModel ()

@property (nonatomic, strong) RACCommand *pushCommand;
@property (nonatomic, strong) RACCommand *logoutCommand;

@end

@implementation XPYTestViewModel

- (void)initialize {
    self.pushCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        XPYTestPushViewModel *testPushViewModel = [[XPYTestPushViewModel alloc] initWithServices:self.services];
        [self.services pushViewModel:testPushViewModel animated:YES];
        return [RACSignal empty];
    }];
    
    self.logoutCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [[XPYUserManager shareInstance] deleteCurrentUser];
            [[NSNotificationCenter defaultCenter] postNotificationName:XPYSwitchRootViewControllerNotification object:nil];
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
}

@end
