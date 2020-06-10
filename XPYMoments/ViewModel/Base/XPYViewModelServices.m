//
//  XPYViewModelServices.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/29.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYViewModelServices.h"
#import "XPYRouter.h"
#import "XPYViewControllerHelper.h"

#import "XPYNavigationViewController.h"

@interface XPYViewModelServices ()

@property (nonatomic, strong) XPYNetworkService *networkService;

@end

@implementation XPYViewModelServices

- (instancetype)init {
    self = [super init];
    if (self) {
        self.networkService = [XPYNetworkService sharedService];
    }
    return self;
}

#pragma mark - XPYTransitionProtocol
- (void)pushViewModel:(XPYBaseViewModel *)viewModel animated:(BOOL)animated {
    UIViewController *viewController = (UIViewController *)[[XPYRouter sharedRouter] viewControllerForViewModel:viewModel];
    [[XPYViewControllerHelper currentViewController].navigationController pushViewController:viewController animated:animated];
}
- (void)popViewModelAnimated:(BOOL)animated {
    [[XPYViewControllerHelper currentViewController].navigationController popViewControllerAnimated:animated];
}
- (void)popToViewModel:(XPYBaseViewModel *)viewModel animated:(BOOL)animated {
    UIViewController *viewController = (UIViewController *)[[XPYRouter sharedRouter] viewControllerForViewModel:viewModel];
    NSArray *controllers = [[XPYViewControllerHelper currentViewController].navigationController.viewControllers copy];
    for (UIViewController *controller in controllers) {
        if ([viewController isMemberOfClass:[controller class]]) {
            [[XPYViewControllerHelper currentViewController].navigationController popToViewController:controller animated:animated];
            break;
        }
    }
}
- (void)popToRootViewModelAnimated:(BOOL)animated {
    [[XPYViewControllerHelper currentViewController].navigationController popToRootViewControllerAnimated:animated];
}
- (void)presentViewModel:(XPYBaseViewModel *)viewModel animated:(BOOL)animated completion:(XPYVoidHandler)completion {
}
- (void)dismissViewModelAnimated:(BOOL)animated completion:(XPYVoidHandler)completion {
    [[XPYViewControllerHelper currentViewController] dismissViewControllerAnimated:animated completion:completion];
}
- (void)resetRootViewModel:(XPYBaseViewModel *)viewModel {
    UIViewController *viewController = (UIViewController *)[[XPYRouter sharedRouter] viewControllerForViewModel:viewModel];
    // 确保根视图是NavigationController或者TabBarController
    if (![viewController isKindOfClass:[UINavigationController class]] && ![viewController isKindOfClass:[UITabBarController class]]) {
        viewController = [[XPYNavigationViewController alloc] initWithRootViewController:viewController];
    }
    [UIApplication sharedApplication].delegate.window.rootViewController = viewController;
}
@end
