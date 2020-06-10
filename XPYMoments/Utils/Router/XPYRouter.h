//
//  XPYRouter.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/10.
//  Copyright © 2020 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XPYBaseViewController, XPYBaseViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface XPYRouter : NSObject

+ (instancetype)sharedRouter;

/// 根据ViewModel获取ViewController
/// @param viewModel 传入视图模型
- (XPYBaseViewController *)viewControllerForViewModel:(XPYBaseViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
