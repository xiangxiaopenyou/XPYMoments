//
//  XPYNetworkService+User.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/4.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYNetworkService+User.h"

#import "XPYUserModel.h"

@implementation XPYNetworkService (User)

- (RACSignal *)loginWithUsername:(NSString *)username password:(NSString *)password {
    return [[self request:XPYHTTPRequestTypePost path:XPYUserLoginURL parameters:@{@"tel" : username, @"password" : password}] map:^id _Nullable(id  _Nullable value) {
        return [self mapLoginSuccessResult:value];
    }];// doError:^(NSError * _Nonnull error) {
    //}];
}

- (RACSignal *)mapLoginSuccessResult:(id)result {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        XPYUserModel *user = [XPYUserModel yy_modelWithJSON:result];
        [subscriber sendNext:user];
        [subscriber sendCompleted];
        return nil;
    }];
}

- (RACSignal *)homepageData {
    RACSignal *resultSignal = [[self request:XPYHTTPRequestTypeGet path:@"book-city?action=db-home" parameters:@{@"page" : @1}] map:^id _Nullable(id  _Nullable value) {
        NSLog(@"%@", value);
        return [self mapResult:value];
    }];
    return resultSignal;
}
- (RACSignal *)mapResult:(id)result {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:result];
        [subscriber sendCompleted];
        return nil;
    }];
}

@end
