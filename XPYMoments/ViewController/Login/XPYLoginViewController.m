//
//  XPYLoginViewController.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/28.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYLoginViewController.h"
#import "XPYLoginViewModel.h"

@interface XPYLoginViewController ()

@property (nonatomic, strong) UITextField *usernameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong, readonly) XPYLoginViewModel *viewModel;

@end

@implementation XPYLoginViewController

/// 动态绑定，运行时从父类(XPYBaseViewController)中查找Getter方法
@dynamic viewModel;

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
}

#pragma mark - UI
- (void)configureUI {
    [self.view addSubview:self.usernameTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginButton];
    
    [self.usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(300, 50));
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).mas_offset(50);
        make.centerX.equalTo(self.view);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(300, 50));
        make.top.equalTo(self.usernameTextField.mas_bottom).mas_offset(20);
        make.centerX.equalTo(self.view);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(250, 40));
        make.top.equalTo(self.passwordTextField.mas_bottom).mas_offset(30);
        make.centerX.equalTo(self.view);
    }];
}

#pragma mark - Override methods
- (void)bindViewModel {
    [super bindViewModel];
    
    RAC(self.viewModel, usernameString) = [RACSignal merge:@[RACObserve(self.usernameTextField, text), self.usernameTextField.rac_textSignal]];
    
    RAC(self.viewModel, passwordString) = [RACSignal merge:@[RACObserve(self.passwordTextField, text), self.passwordTextField.rac_textSignal]];
    
    RAC(self.loginButton, enabled) = self.viewModel.loginValidSignal;
    
    RAC(self.loginButton, backgroundColor) = [self.viewModel.loginValidSignal map:^id _Nullable(id  _Nullable value) {
        return [value boolValue] ? [UIColor redColor] : [UIColor grayColor];
    }];
    
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"点击登录");
        [self.viewModel.loginCommand execute:nil];
    }];
    
    // HUD
    [[[self.viewModel.loginCommand.executing skip:1] deliverOnMainThread] subscribeNext:^(NSNumber * _Nullable x) {
        [self.view endEditing:YES];
        if (x.boolValue) {
            [MBProgressHUD xpy_showActivityHUDWithTips:nil];
        } else if (!self.viewModel.loginCommand.errors) {   // 没有错误时隐藏
            [MBProgressHUD xpy_hideHUD];
        }
    }];
    [[self.viewModel.loginCommand.errors deliverOnMainThread] subscribeNext:^(NSError * _Nullable x) {
        [MBProgressHUD xpy_showTips:x.userInfo[NSUnderlyingErrorKey]];
    }];
}

#pragma mark - Getters
- (UITextField *)usernameTextField {
    if (!_usernameTextField) {
        _usernameTextField = [[UITextField alloc] init];
        _usernameTextField.backgroundColor = [UIColor grayColor];
        _usernameTextField.placeholder = @"用户名";
    }
    return _usernameTextField;
}
- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.placeholder = @"密码";
        _passwordTextField.backgroundColor = [UIColor grayColor];
        _passwordTextField.secureTextEntry = YES;
    }
    return _passwordTextField;
}
- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setBackgroundColor:[UIColor redColor]];
    }
    return _loginButton;;
}

@end
