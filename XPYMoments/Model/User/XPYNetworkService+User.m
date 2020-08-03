//
//  XPYNetworkService+User.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/4.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYNetworkService+User.h"

#import "XPYUserModel.h"

@implementation XPYNetworkService (User)

- (RACSignal *)loginWithUsername:(NSString *)username password:(NSString *)password {
    RACSignal *resultSignal = [[self request:XPYHTTPRequestTypePost path:XPYUserLoginURL parameters:@{@"tel" : username, @"password" : password, @"type" : @"login_by_pwd"}] map:^id _Nullable(id  _Nullable value) {
        XPYUserModel *user = [XPYUserModel yy_modelWithJSON:value];
        return user;
    }];
    return resultSignal;
}

@end
