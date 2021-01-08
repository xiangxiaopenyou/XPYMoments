//
//  XPYMacros.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/1.
//  Copyright © 2020 xiang. All rights reserved.
//  宏文件

#import "XPYEnums.h"
#import "XPYConstant.h"
#import "XPYConstInline.h"

/// App Document文件夹路径
#define XPYDocumentDirectory NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject

/// 弱引用对象
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;

/// 强引用对象
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;

/// 以375宽度屏幕为基准自适应
#define XPYScreenScaleConstant(aConstant) CGRectGetWidth([UIScreen mainScreen].bounds) / 375 * aConstant

