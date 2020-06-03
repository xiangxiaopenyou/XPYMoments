//
//  XPYLoginViewModel.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/28.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYLoginViewModel.h"
#import "XPYUserAPIManager.h"

@interface XPYLoginViewModel ()

@property (nonatomic, copy) NSString *usernameString;
@property (nonatomic, copy) NSString *passwordString;

@end

@implementation XPYLoginViewModel

- (void)initialize {
    self.loginValidSignal = [RACSignal combineLatest:@[RACObserve(self, usernameString), RACObserve(self, passwordString)] reduce:^(NSString *username, NSString *password){
        return @(username.length > 0 && password.length >= 6);
    }];
    
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [[[self loginRequest] doNext:^(id  _Nullable x) {
            // 请求完成之后的操作
        }] doCompleted:^{
            
        }];
    }];
}

- (RACSignal *)loginRequest {
    return [[XPYUserAPIManager new] loadData];
}

@end
