//
//  XPYNetworkService.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/2.
//  Copyright © 2020 xiang. All rights reserved.
//  网络请求服务类，实现XPYNetworkServiceProtocol协议

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XPYNetworkService : NSObject

/// 获取完整请求链接
/// @param methodName 方法名
/// @param type 请求类型
+ (NSString *)completeRequestURLStringWithMethod:(NSString *)methodName requestType:(XPYHTTPRequestType)type;


/// 获取完整的请求参数（为了拼接统一参数，如ID、Token）
/// @param params 接口传入参数
+ (NSDictionary *)completeParametersWithParams:(NSDictionary *)params;

/// 解析responseObject
/// @param responseObject 请求成功结果统一解析
+ (id)resultWithResponseObject:(id)responseObject;

@end

NS_ASSUME_NONNULL_END
