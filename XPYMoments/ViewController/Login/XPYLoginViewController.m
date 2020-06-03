//
//  XPYLoginViewController.m
//  XPYMoments
//
//  Created by zhangdu_imac on 2020/5/28.
//  Copyright © 2020 xiang. All rights reserved.
//

#import "XPYLoginViewController.h"
#import "XPYLoginViewModel.h"

#import <MBProgressHUD.h>

@interface XPYLoginViewController ()

@property (nonatomic, strong) UITextField *usernameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) XPYLoginViewModel *viewModel;

@end

@implementation XPYLoginViewController

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
        make.top.equalTo(self.view.mas_top).mas_offset(80);
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
    
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"点击登录");
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [[self.viewModel.loginCommand execute:nil] subscribeCompleted:^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }];
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
