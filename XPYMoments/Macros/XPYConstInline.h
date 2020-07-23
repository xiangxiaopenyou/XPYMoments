//
//  XPYConstInline.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/7/20.
//  Copyright © 2020 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef XPYConstInline_h
#define XPYConstInline_h

/// 创建文件夹
/// @param path 文件夹路径
static inline BOOL XPYCreateDirectoryAtPath(NSString *path) {
    BOOL isDirectory = NO;
    // 路径下是否已存在文件或者文件夹
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
    if (isExist && isDirectory) {
        // 已存在该文件夹
        return YES;
    }
    if (isExist && !isDirectory) {
        // 已存在文件，但不是文件夹，则删除文件
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    }
    // 创建文件夹
    return [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];;
}

#endif /* XPYConstInline_h */
