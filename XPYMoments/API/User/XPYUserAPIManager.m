//
//  XPYUserAPIManager.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/2.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYUserAPIManager.h"

@implementation XPYUserAPIManager

- (NSString *)methodName {
    return @"book-city?action=db-home";;
}
- (XPYHTTPRequestType)requestType {
    return XPYHTTPRequestTypeGet;
}
- (NSDictionary *)requestParams {
    return @{@"page" : @1};
}

@end
