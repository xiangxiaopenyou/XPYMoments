//
//  XPYNetworkService.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/2.
//  Copyright © 2020 xiang. All rights reserved.
//  网络请求服务类，实现XPYNetworkServiceProtocol协议

#import <Foundation/Foundation.h>

@class XPYNetworkManager;

NS_ASSUME_NONNULL_BEGIN

@interface XPYNetworkService : NSObject

/// 使用单例
+ (instancetype)sharedService;

/// 普通网络请求
/// @param type 请求类型(GET或者POST)
/// @param path 请求路径(拼接在BaseURL后面)
/// @param parameters 请求参数
- (RACSignal *)request:(XPYHTTPRequestType)type
                  path:(NSString *)path
            parameters:(NSDictionary * _Nullable)parameters;

/// 上传文件请求
/// @param fileDatas 文件数据
/// @param bucketName 文件上传对应服务器上的字段
/// @param mimeType 媒体类型，默认为application/octet-stream
- (RACSignal *)uploadRequestWithFileDatas:(NSArray <NSData *> *)fileDatas
                               bucketName:(NSString *)bucketName
                                 mimeType:(NSString *)mimeType;

/// 下载文件请求
/// @param filePath 文件保存路径
- (RACSignal *)downloadRequestWithFilePath:(NSString *)filePath;

@property (nonatomic, strong, readonly) XPYNetworkManager *manager;

@end

NS_ASSUME_NONNULL_END
