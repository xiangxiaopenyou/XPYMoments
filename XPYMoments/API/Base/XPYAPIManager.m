//
//  XPYBaseAPIManager.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/2.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYAPIManager.h"
#import "XPYNetworkService.h"
#import "XPYNetworkManager.h"

@implementation XPYAPIManager

- (instancetype)init {
    self = [super init];
    if (self) {
        if ([self conformsToProtocol:@protocol(XPYHTTPRequestProtocol)]) {
            self.child = (id<XPYHTTPRequestProtocol>)self;
        } else {
            // 子类未实现协议，则抛出异常
            NSException *exception = [NSException exceptionWithName:@"ProtocolException" reason:@"子类未实现XPYHTTPRequestProtocol协议" userInfo:nil];
            @throw exception;
        }
    }
    return self;
}

#pragma mark - Instance method
- (RACSignal *)loadData {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSString *requestURLString = [XPYNetworkService completeRequestURLStringWithMethod:[self.child methodName] requestType:[self.child requestType]];
        NSDictionary *requestParams = [self.child respondsToSelector:@selector(requestParams)] ? [self.child requestParams] : nil;
        requestParams = [XPYNetworkService completeParametersWithParams:requestParams];
        switch ([self.child requestType]) {
            case XPYHTTPRequestTypeGet: {
                [[XPYNetworkManager sharedInstance] getWithURL:requestURLString parameters:requestParams success:^(id responseObject) {
                    [subscriber sendNext:responseObject];
                    [subscriber sendCompleted];
                } failure:^(NSError *error) {
                    [subscriber sendError:error];
                }];
            }
                break;
            case XPYHTTPRequestTypePost: {
                [[XPYNetworkManager sharedInstance] postWithURL:requestURLString parameters:requestParams success:^(id responseObject) {
                    [subscriber sendNext:responseObject];
                    [subscriber sendCompleted];
                } failure:^(NSError *error) {
                    [subscriber sendError:error];
                }];
            }
                break;
            case XPYHTTPRequestTypeUploadFile: {
                [[XPYNetworkManager sharedInstance] uploadFileWithURL:requestURLString parameters:requestParams bucketName:[self.child bucketName] filePath:[self.child filePath] progress:^(NSProgress *progress) {
                    
                } success:^(id responseObject) {
                } failure:^(NSError *error) {
                }];
            }
                break;
            case XPYHTTPRequestTypeDownloadFile: {
                NSString *fileDirectory = nil;
                if ([self.child downloadFilePath]) {
                    fileDirectory = [self.child downloadFilePath];
                }
                [[XPYNetworkManager sharedInstance] downloadFileWithURL:requestURLString fileDirectory:fileDirectory progress:^(NSProgress *progress) {
                } success:^(id responseObject) {
                } failure:^(NSError *error) {
                }];
            }
                break;
        }
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
    return signal;
}

@end
