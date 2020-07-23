//
//  XPYArchiveManager.h
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/7/20.
//  Copyright © 2020 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XPYArchiveManager : NSObject

/// 归档对象
/// @param object 对象
/// @param fileName 文件名
+ (BOOL)archeveObject:(id)object fileName:(NSString *)fileName;

/// 归档对象
/// @param object 对象
/// @param directoryPath 文件夹路径，默认DocumentDirectory路径
/// @param directoryName 下一级文件夹名称
/// @param fileName 文件名
+ (BOOL)archeveObject:(id)object directoryPath:(NSString * _Nullable)directoryPath directoryName:(NSString *_Nullable)directoryName fileName:(NSString *)fileName;

/// 对象解档
/// @param objectClass 对象类
/// @param fileName 文件名
+ (id)unarcheveObjectWithClass:(id)objectClass fileName:(NSString *)fileName;

/// 对象解档
/// @param objectClass 对象类
/// @param directoryPath 文件夹路径，默认DocumentDirectory路径
/// @param directoryName 下一级文件夹名称
/// @param fileName 文件名
+ (id)unarcheveObjectWithClass:(id)objectClass directoryPath:(NSString * _Nullable)directoryPath directoryName:(NSString *_Nullable)directoryName fileName:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
