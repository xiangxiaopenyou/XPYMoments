//
//  XPYNetworkService+User.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/4.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYNetworkService.h"

NS_ASSUME_NONNULL_BEGIN

@interface XPYNetworkService (User)

/// 用户登录
/// @param username 用户名
/// @param password 密码
- (RACSignal *)loginWithUsername:(NSString *)username password:(NSString *)password;

- (RACSignal *)homepageData;

@end

NS_ASSUME_NONNULL_END
