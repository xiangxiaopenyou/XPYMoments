//
//  AppDelegate.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/27.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Life cycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *controller = [[UIViewController alloc] init];
    controller.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
