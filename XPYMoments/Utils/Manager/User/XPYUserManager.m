//
//  XPYUserManager.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/7/27.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYUserManager.h"
#import "XPYArchiveManager.h"

@interface XPYUserManager ()

@property (nonatomic, strong) XPYUserModel *currentUser;
@property (nonatomic, assign) BOOL isLogin;

@end

@implementation XPYUserManager

+ (instancetype)shareInstance {
    static XPYUserManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[XPYUserManager alloc] init];
    });
    return instance;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.currentUser = [XPYArchiveManager unarcheveObjectWithClass:[XPYUserModel class] directoryPath:XPYDocumentDirectory directoryName:XPYMomentsDocumentDirectoryName fileName:XPYMomentsUserDataFileName];
        _isLogin = !XPYIsEmptyObject(self.currentUser);
    }
    return self;
}

- (BOOL)saveUser:(XPYUserModel *)user {
    if (XPYIsEmptyObject(user)) {
        return NO;
    }
    BOOL isSaved = [XPYArchiveManager archeveObject:user directoryPath:XPYDocumentDirectory directoryName:XPYMomentsDocumentDirectoryName fileName:XPYMomentsUserDataFileName];
    if (isSaved) {
        self.currentUser = user;
    }
    _isLogin = isSaved;
    return isSaved;
}
- (void)deleteCurrentUser {
    if (XPYIsEmptyObject(self.currentUser)) {
        return;
    }
    self.currentUser = nil;
    NSString *filePath = [[XPYDocumentDirectory stringByAppendingPathComponent:XPYMomentsDocumentDirectoryName] stringByAppendingPathComponent:XPYMomentsUserDataFileName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
        _isLogin = NO;
    }
}

@end
