//
//  XPYNetworkService.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/2.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYNetworkService.h"
#import "XPYNetworkManager.h"

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

@interface XPYNetworkService ()

@property (nonatomic, strong) XPYNetworkManager *manager;

@end

@implementation XPYNetworkService

+ (instancetype)sharedService {
    static XPYNetworkService *service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[XPYNetworkService alloc] init];
    });
    return service;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.manager = [XPYNetworkManager sharedInstance];
    }
    return self;
}

/// 获取完整请求链接
/// @param path 路径
/// @param type 请求类型
- (NSString *)completeRequestURLStringWithPath:(NSString *)path requestType:(XPYHTTPRequestType)type {
    if (type == XPYHTTPRequestTypeDownloadFile) {
        return kXPYDownloadURL;
    }
    return path ? [kXPYBaseURL stringByAppendingPathComponent:path] : kXPYBaseURL;
}

/// 获取完整的请求参数（为了拼接统一参数，如ID、Token）
/// @param params 接口传入参数
- (NSDictionary *)completeParametersWithParams:(NSDictionary *)params {
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

/// 解析数据
/// @param responseObject 返回数据
- (id)resultWithResponseObject:(id)responseObject {
    if (!responseObject || ![responseObject isKindOfClass:[NSDictionary class]]) {
        // 返回为空或者返回格式不正确时的错误代码可自行设计，暂时设为-1
        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:-1 userInfo:@{NSUnderlyingErrorKey : @"返回格式错误"}];
        return error;
    }
    if ([responseObject[@"errno"] integerValue] == 0) {    //上述例子中当errno为0时请求成功，反之则有各种错误，错误代码可与服务端沟通
        return responseObject[@"data"];     //上述例子中把接口数据放在data中
    } else {
        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:[responseObject[@"errno"] integerValue] userInfo:@{NSUnderlyingErrorKey : responseObject[@"msg"]}];
        return error;
    }
}

#pragma mark - Instance methods
- (RACSignal *)request:(XPYHTTPRequestType)type path:(NSString *)path parameters:(NSDictionary *)parameters {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        if (type == XPYHTTPRequestTypeGet) {
            [self.manager getWithURL:[self completeRequestURLStringWithPath:path requestType:type] parameters:[self completeParametersWithParams:parameters] success:^(id  _Nonnull responseObject) {
                id result = [self resultWithResponseObject:responseObject];
                if ([result isMemberOfClass:[NSError class]]) {
                    [subscriber sendError:result];
                } else {
                    [subscriber sendNext:result];
                    [subscriber sendCompleted];
                }
            } failure:^(NSError * _Nonnull error) {
                [subscriber sendError:error];
            }];
        } else if (type == XPYHTTPRequestTypePost) {
            [self.manager postWithURL:[self completeRequestURLStringWithPath:path requestType:type] parameters:[self completeParametersWithParams:parameters] success:^(id  _Nonnull responseObject) {
                
            } failure:^(NSError * _Nonnull error) {
                
            }];
        }
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
    return signal;
}
- (RACSignal *)uploadRequestWithFileDatas:(NSArray<NSData *> *)fileDatas bucketName:(NSString *)bucketName mimeType:(NSString *)mimeType {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
    return signal;
}
- (RACSignal *)downloadRequestWithFilePath:(NSString *)filePath {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
    return signal;
}

@end
