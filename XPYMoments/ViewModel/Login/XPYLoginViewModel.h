//
//  XPYLoginViewModel.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/28.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XPYLoginViewModel : XPYBaseViewModel

/// 用户名
@property (nonatomic, copy, readonly) NSString *usernameString;

/// 密码
@property (nonatomic, copy, readonly) NSString *passwordString;

/// 登录按钮是否有效信号
@property (nonatomic, strong) RACSignal *loginValidSignal;

/// 登录命令
@property (nonatomic, strong) RACCommand *loginCommand;

@end

NS_ASSUME_NONNULL_END
