//
//  XPYTransitionProtocol.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/29.
//  Copyright © 2020 xiang. All rights reserved.
//  转场协议push、present

#import <Foundation/Foundation.h>

@class XPYBaseViewModel;

@protocol XPYTransitionProtocol <NSObject>

/// Push
/// @param viewModel 视图模型
/// @param animated 是否过渡动画
- (void)pushViewModel:(XPYBaseViewModel *)viewModel animated:(BOOL)animated;

/// Pop
/// @param animated 是否过渡动画
- (void)popViewModelAnimated:(BOOL)animated;

/// Pop 根控制器
/// @param animated 是否过渡动画
- (void)popToRootViewModelAnimated:(BOOL)animated;

/// Pop 指定控制器
/// @param viewModel 视图模型
/// @param animated 是否过渡动画
- (void)popToViewModel:(XPYBaseViewModel *)viewModel animated:(BOOL)animated;

/// Present
/// @param viewModel 视图模型
/// @param animated 是否过渡动画
/// @param completion 完成回调Block
- (void)presentViewModel:(XPYBaseViewModel *)viewModel animated:(BOOL)animated completion:(XPYVoidHandler)completion;

/// dismiss
/// @param animated 是否过渡动画
/// @param completion 完成回调Block
- (void)dismissViewModelAnimated:(BOOL)animated completion:(XPYVoidHandler)completion;

@end
