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

#import "XPYViewModelServices.h"

@interface AppDelegate ()

@property (nonatomic, strong) XPYViewModelServices *services;

@end

@implementation AppDelegate

#pragma mark - Life cycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.services = [[XPYViewModelServices alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self resetRootViewController];
    [self.window makeKeyAndVisible];
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:XPYSwitchRootViewControllerNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        [self resetRootViewController];
    }];
    return YES;
}

- (void)resetRootViewController {
    [self.services resetRootViewModel:[self rootViewModel]];
}
- (XPYBaseViewModel *)rootViewModel {
    id object = [[NSUserDefaults standardUserDefaults] objectForKey:@"Login"];
    if (object) {
        return [[XPYTestViewModel alloc] initWithServices:self.services];
    } else {
        return [[XPYLoginViewModel alloc] initWithServices:self.services];
    }
}

@end
