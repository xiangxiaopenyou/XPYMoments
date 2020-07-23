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
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *phone;

@end

NS_ASSUME_NONNULL_END
