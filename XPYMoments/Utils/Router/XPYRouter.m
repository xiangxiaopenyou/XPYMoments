//
//  XPYRouter.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/6/10.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYRouter.h"

#import "XPYBaseViewController.h"
#import "XPYBaseViewModel.h"

@implementation XPYRouter

+ (instancetype)sharedRouter {
    static XPYRouter *router = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[XPYRouter alloc] init];
    });
    return router;
}

- (XPYBaseViewController *)viewControllerForViewModel:(XPYBaseViewModel *)viewModel {
    NSString *controllerClassString = (NSString *)[[self mappings] objectForKey:NSStringFromClass([viewModel class])];
    
    // 检查是否XPYBaseViewController的子类，不是则报错
    NSParameterAssert([NSClassFromString(controllerClassString) isSubclassOfClass:[XPYBaseViewController class]]);
    // 检查是否实现initWithViewModel实例方法，不是则报错
    NSParameterAssert([NSClassFromString(controllerClassString) instancesRespondToSelector:@selector(initWithViewModel:)]);
    
    XPYBaseViewController *controller = [[NSClassFromString(controllerClassString) alloc] initWithViewModel:viewModel];
    return controller;
}

- (NSDictionary *)mappings {
    return @{@"XPYLoginViewModel" : @"XPYLoginViewController",
             @"XPYTestViewModel" : @"XPYTestViewController",
             @"XPYTestPushViewModel" : @"XPYTestPushViewController"
    };
}
@end
