//
//  XPYUserModel.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/2.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYUserModel.h"

@implementation XPYUserModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
        @"userId" : @"user_id",
        @"phone" : @"tel",
        @"gender" : @"sex"
    };
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [self yy_modelEncodeWithCoder:coder];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    return [self yy_modelInitWithCoder:coder];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
