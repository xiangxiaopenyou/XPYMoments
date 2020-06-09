//
//  XPYViewModelServices.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/29.
//  Copyright © 2020 xiang. All rights reserved.
//  视图模型服务类，包括页面跳转、网络请求服务

#import <Foundation/Foundation.h>
#import "XPYTransitionProtocol.h"
#import "XPYNetworkService.h"

NS_ASSUME_NONNULL_BEGIN

@interface XPYViewModelServices : NSObject <XPYTransitionProtocol>

/// 网络请求服务
@property (nonatomic, strong, readonly) XPYNetworkService *networkService;

@end

NS_ASSUME_NONNULL_END
