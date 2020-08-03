//
//  XPYTableViewCell.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/7/31.
//  Copyright © 2020 xiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XPYTableViewCell : UITableViewCell

/// 提供给子类复写绑定视图模型方法
/// @param viewModel 视图模型
- (void)bindViewModel:(id)viewModel;

@end

NS_ASSUME_NONNULL_END
