//
//  XPYAPIManager.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/2.
//  Copyright © 2020 xiang. All rights reserved.
//  接口类的基类

#import <Foundation/Foundation.h>
#import "XPYHTTPRequestProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface XPYAPIManager : NSObject

/// 唯一请求方法
- (RACSignal *)loadData;

/// 接口类的子类，需要实现XPYHTTPRequestProtocol协议
@property (nonatomic, weak) NSObject<XPYHTTPRequestProtocol> *child;

@end

NS_ASSUME_NONNULL_END
