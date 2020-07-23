//
//  XPYTestViewModel.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/27.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYTestViewModel.h"
#import "XPYTestPushViewModel.h"

#import "XPYUserModel.h"
#import "XPYArchiveManager.h"

@interface XPYTestViewModel ()

@property (nonatomic, strong) RACCommand *pushCommand;

@end

@implementation XPYTestViewModel

- (void)initialize {
    self.pushCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        XPYTestPushViewModel *testPushViewModel = [[XPYTestPushViewModel alloc] initWithServices:self.services];
        [self.services pushViewModel:testPushViewModel animated:YES];
        return [RACSignal empty];
    }];
    
    XPYUserModel *user = [[XPYUserModel alloc] init];
    user.userId = @"123";
    user.username = @"xxpy";
    user.phone = @"13732254511";
    BOOL isArchived = [XPYArchiveManager archeveObject:user directoryPath:XPYDocumentDirectory directoryName:XPYMomentsDocumentDirectoryName fileName:XPYMomentsUserDataFileName];
    if (isArchived) {
        NSLog(@"归档成功");
        XPYUserModel *temp = [XPYArchiveManager unarcheveObjectWithClass:[XPYUserModel class] directoryPath:XPYDocumentDirectory directoryName:XPYMomentsDocumentDirectoryName fileName:XPYMomentsUserDataFileName];
        NSLog(@"解档结果：%@ %@ %@", temp.username, temp.userId, temp.phone);
    }
}

@end
