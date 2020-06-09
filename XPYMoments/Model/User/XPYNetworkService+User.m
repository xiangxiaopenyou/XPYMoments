//
//  XPYNetworkService+User.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/4.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYNetworkService+User.h"

@implementation XPYNetworkService (User)

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
