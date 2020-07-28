//
//  XPYUserManager.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/7/27.
//  Copyright © 2020 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XPYUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XPYUserManager : NSObject

+ (instancetype)shareInstance;

/// 保存用户
/// @param user 用户Model
- (BOOL)saveUser:(XPYUserModel *)user;

/// 删除当前用户
- (void)deleteCurrentUser;

/// 当前登录用户
@property (nonatomic, strong, readonly) XPYUserModel *currentUser;
/// 是否登录
@property (nonatomic, assign, readonly) BOOL isLogin;

@end

NS_ASSUME_NONNULL_END
