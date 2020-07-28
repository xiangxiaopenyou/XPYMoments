//
//  XPYLoginViewModel.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/28.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYLoginViewModel.h"
#import "XPYUserManager.h"
#import "XPYNetworkService+User.h"

#import <CocoaSecurity.h>

@interface XPYLoginViewModel ()

@property (nonatomic, copy) NSString *usernameString;
@property (nonatomic, copy) NSString *passwordString;

@property (nonatomic, strong) RACSignal *loginValidSignal;
@property (nonatomic, strong) RACCommand *loginCommand;

@end

@implementation XPYLoginViewModel

- (void)initialize {
    self.loginValidSignal = [RACSignal combineLatest:@[RACObserve(self, usernameString), RACObserve(self, passwordString)] reduce:^(NSString *username, NSString *password){
        return @(username.length > 0 && password.length >= 6);
    }];
    
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        [self loginRequest];
        return [RACSignal empty];
    }];
}

- (void)loginRequest {
    [[self.services.networkService loginWithUsername:self.usernameString password:[CocoaSecurity md5:self.passwordString].hexLower] subscribeNext:^(id  _Nullable x) {
        if (x && [x isMemberOfClass:[XPYUserModel class]]) {
            // 请求完成之后保存用户信息
            if ([[XPYUserManager shareInstance] saveUser:(XPYUserModel *)x]) {
                [[NSNotificationCenter defaultCenter] postNotificationName:XPYSwitchRootViewControllerNotification object:nil];
            }
        }
    }];
}

@end
