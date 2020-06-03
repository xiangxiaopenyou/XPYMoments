//
//  XPYNetworkService.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/2.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYNetworkService.h"

/// 示例BaseURL
#if DEBUG
static NSString * const kXPYBaseURL = @"http://testapp.zhangdu.com/v1";
static NSString * const kXPYDownloadURL = @"http://zhangdu-test.oss-cn-shanghai.aliyuncs.com/app/package/voice.zip";
#else
static NSString * const kXPYBaseURL = @"";
#endif

/// 示例参数
static NSString * const kXPYChannelId = @"u2000";
static NSInteger const kXPYClientType = 2;
static NSString * const kXPYDeviceToken = @"54A26B87-4B33-468B-99D3-1A8651B6CD81";
static NSString * const kXPYVersion = @"1.4.0";

@implementation XPYNetworkService

+ (NSString *)completeRequestURLStringWithMethod:(NSString *)methodName requestType:(XPYHTTPRequestType)type {
    if (type == XPYHTTPRequestTypeDownloadFile) {
        return kXPYDownloadURL;
    }
    return methodName ? [kXPYBaseURL stringByAppendingPathComponent:methodName] : kXPYBaseURL;
}

+ (NSDictionary *)completeParametersWithParams:(NSDictionary *)params {
    NSMutableDictionary *temp = [NSMutableDictionary dictionaryWithDictionary:params];
    [temp setObject:kXPYChannelId forKey:@"channel_id"];
    [temp setObject:@(kXPYClientType) forKey:@"client_type"];
    [temp setObject:kXPYDeviceToken forKey:@"device_token"];
    // 先判断是否保存了UserId和Token(根据需求自由发挥)
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"XPYUserId"]) {
        [temp setObject:[[NSUserDefaults standardUserDefaults] objectForKey:@"XPYUserId"] forKey:@"user_id"];
        [temp setObject:[[NSUserDefaults standardUserDefaults] objectForKey:@"XPYUserToken"]  forKey:@"token"];
    }

    [temp setObject:kXPYVersion forKey:@"version"];
    return (NSDictionary *)[temp copy];
}

+ (id)resultWithResponseObject:(id)responseObject {
    return responseObject;
}

@end
