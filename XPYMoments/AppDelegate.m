//
//  AppDelegate.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/27.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "AppDelegate.h"
#import "XPYTestViewController.h"
#import "XPYTestViewModel.h"
#import "XPYLoginViewController.h"
#import "XPYLoginViewModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Life cycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    XPYTestViewController *controller = [[XPYTestViewController alloc] initWithViewModel:[[XPYTestViewModel alloc] init]];
//    controller.view.backgroundColor = [UIColor whiteColor];
    
    XPYLoginViewController *loginController = [[XPYLoginViewController alloc] initWithViewModel:[[XPYLoginViewModel alloc] init]];
    self.window.rootViewController = loginController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
