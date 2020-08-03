//
//  XPYTableViewModel.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/7/30.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XPYTableViewModel : XPYBaseViewModel

/// 数据源（多段section和单段section数据源格式不一样）
@property (nonatomic, copy, readonly) NSArray *dataSource;

/// TableView是否分多段Section
@property (nonatomic, assign) BOOL isMultiSections;

/// Table view style
@property (nonatomic, assign) UITableViewStyle tableViewStyle;

@end

NS_ASSUME_NONNULL_END
