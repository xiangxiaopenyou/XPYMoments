//
//  XPYBaseViewController.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/27.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYBaseViewController.h"
#import "XPYBaseViewModel.h"

@interface XPYBaseViewController ()

/// 子类中使用@dynamic viewModel（不实现Getter方法），则需要从父类中查找相应方法
@property (nonatomic, strong) XPYBaseViewModel *viewModel;

@end

@implementation XPYBaseViewController

#pragma mark - Initializer
- (instancetype)initWithViewModel:(XPYBaseViewModel *)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
}

#pragma mark - Instance methods
- (void)bindViewModel {
    // 绑定页面标题
    RAC(self, title) = RACObserve(self.viewModel, title);
    // 绑定页面背景颜色
    RAC(self.view, backgroundColor) = RACObserve(self.viewModel, backgroundColor);
    NSLog(@"bind success");
}

@end
