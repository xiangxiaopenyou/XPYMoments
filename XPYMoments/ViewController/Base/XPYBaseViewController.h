//
//  XPYBaseViewController.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/27.
//  Copyright © 2020 xiang. All rights reserved.
//  所有视图控制器的基类

#import <UIKit/UIKit.h>

@class XPYBaseViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface XPYBaseViewController : UIViewController

/// 统一初始化方法
/// @param viewModel 视图模型
- (instancetype)initWithViewModel:(XPYBaseViewModel *)viewModel;

/// 提供给子类复写绑定视图模型方法
- (void)bindViewModel;

@property (nonatomic, strong, readonly) XPYBaseViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
