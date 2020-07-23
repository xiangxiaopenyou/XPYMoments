//
//  XPYArchiveManager.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/7/20.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYArchiveManager.h"

@implementation XPYArchiveManager

+ (BOOL)archeveObject:(id)object fileName:(NSString *)fileName {
    return [self archeveObject:object directoryPath:nil directoryName:nil fileName:fileName];
}
+ (BOOL)archeveObject:(id)object directoryPath:(NSString *)directoryPath directoryName:(NSString *)directoryName fileName:(NSString *)fileName {
    if (XPYIsEmptyObject(object)) {
        NSLog(@"对象为空");
        return NO;
    }
    BOOL supportSecureCoding = NO;
    if ([object conformsToProtocol:@protocol(NSSecureCoding)]) {    // 安全编码
        supportSecureCoding = YES;
    } else if ([object conformsToProtocol:@protocol(NSCoding)]) {   // 普通编码
        supportSecureCoding = NO;
    }
    NSError *error = nil;
    NSData *resultData = [NSKeyedArchiver archivedDataWithRootObject:object requiringSecureCoding:supportSecureCoding error:&error];
    if (error || !resultData) {
        NSLog(@"归档数据失败");
        return NO;
    }
    NSString *filePath = [self filePathWithDirectoryPath:directoryPath directoryName:directoryName fileName:fileName];
    if (!filePath) {
        return NO;
    }
    return [resultData writeToFile:filePath atomically:YES];
}

+ (id)unarcheveObjectWithClass:(id)objectClass fileName:(NSString *)fileName {
    return [self unarcheveObjectWithClass:objectClass directoryPath:nil directoryName:nil fileName:fileName];
}
+ (id)unarcheveObjectWithClass:(id)objectClass directoryPath:(NSString *)directoryPath directoryName:(NSString *)directoryName fileName:(NSString *)fileName {
    NSString *filePath = [self filePathWithDirectoryPath:directoryPath directoryName:directoryName fileName:fileName];
    if (!filePath) {
        return nil;
    }
    NSData *resultData = [NSData dataWithContentsOfFile:filePath];
    return [NSKeyedUnarchiver unarchivedObjectOfClass:objectClass fromData:resultData error:nil];
}

/// 获取文件路径
/// @param directoryPath 文件夹路径
/// @param directoryName 下一级文件夹名称
/// @param fileName 文件名称
+ (NSString *)filePathWithDirectoryPath:(NSString * _Nullable)directoryPath directoryName:(NSString * _Nullable)directoryName fileName:(NSString *)fileName {
    NSString *directory = directoryPath ? directoryPath : XPYDocumentDirectory;
    if (directoryName) {
        directory = [directory stringByAppendingPathComponent:directoryName];
    }
    if (!XPYCreateDirectoryAtPath(directory)) {
        NSLog(@"创建文件夹失败");
        return nil;
    }
    return [directory stringByAppendingPathComponent:fileName];
}

@end
