//
//  XPYUserModel.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/2.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XPYUserModel : XPYBaseModel <NSSecureCoding>

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *phone;
/// 性别
@property (nonatomic, assign) NSInteger gender;

@end

NS_ASSUME_NONNULL_END
