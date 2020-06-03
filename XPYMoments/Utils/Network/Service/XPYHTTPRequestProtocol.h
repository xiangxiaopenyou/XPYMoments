//
//  XPYHTTPRequestProtocol.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/1.
//  Copyright © 2020 xiang. All rights reserved.
//  请求参数协议

#import <Foundation/Foundation.h>

@protocol XPYHTTPRequestProtocol <NSObject>

@required
/// 方法名
- (NSString *)methodName;

/// 请求类型
- (XPYHTTPRequestType)requestType;

@optional
/// 请求参数
- (NSDictionary *)requestParams;

#pragma mark - XPYHTTPRequestTypeUploadFile时需要
/// 文件上传对应服务器上的字段
- (NSString *)bucketName;

/// 文件本地路径
- (NSString *)filePath;

#pragma mark - XPYHTTPRequestTypeDownloadFile时需要
/// 下载文件保存路径
- (NSString *)downloadFilePath;


@end
