//
//  XPYBaseViewModel.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/27.
//  Copyright © 2020 xiang. All rights reserved.
//  所有视图模型的基类

#import <Foundation/Foundation.h>
#import "XPYViewModelServices.h"

NS_ASSUME_NONNULL_BEGIN

@interface XPYBaseViewModel : NSObject

/// 统一初始化方法
/// @param services 服务
- (instancetype)initWithServices:(XPYViewModelServices *)services;

/// 提供给子类复写初始化数据方法
- (void)initialize;

@property (nonatomic, strong, readonly) XPYViewModelServices *services;

/// 页面Title
@property (nonatomic, strong) NSString *title;

@end

NS_ASSUME_NONNULL_END
