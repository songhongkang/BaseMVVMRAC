//
//  YS_LoginVC.m
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/8.
//  Copyright © 2019 demo. All rights reserved.
//

#import "YS_LoginVC.h"
#import <Masonry.h>
#import <ReactiveObjC.h>
#import "YS_HomeVC.h"
#import "YS_HomeViewModel.h"
#import "YS_LoginViewModel.h"
#import "YS_Button.h"
#import <MBProgressHUD.h>



@interface YS_LoginVC ()

@property (nonatomic, weak) YS_Button *loginBtn;
@property (nonatomic, weak) UITextField *usernameTextField;
@property (nonatomic, weak) UITextField *passwordTextField;

@property (nonatomic, strong) YS_LoginViewModel *viewModel;
@end

@implementation YS_LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:223.0/255 green:223.0/255 blue:223.0/255 alpha:1];
//    [self createUI];
    [self setupUI];
    
    @weakify(self);
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.viewModel.loginCommand execute:nil];
    }];
    
   [[[self.viewModel.loginCommand.executing skip:1] doNext:^(NSNumber * _Nullable x) {
       [self.view endEditing:YES];
    }] subscribeNext:^(NSNumber * _Nullable x) {
        if ([x boolValue]) {
            [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES].label.text = @"Logging in...";
        }else{
            [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
        }
    }];
    
    [[[self.viewModel.loginCommand.errors deliverOnMainThread] doNext:^(NSError * _Nullable x) {
        [self.view endEditing:YES];
    }] subscribeNext:^(NSError * _Nullable x) {
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
     MBProgressHUD *hud  =  [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = @"账号或者密码错误";
        [hud hideAnimated:YES afterDelay:5];
    }];
}

- (void)bingViewModel
{
    [super bingViewModel];
    /// 绑定数据到viewmodel
    RAC(self.viewModel, username) = [self.usernameTextField rac_textSignal];
    RAC(self.viewModel, password) = [self.passwordTextField rac_textSignal];
    RAC(self.loginBtn,enabled) = self.viewModel.vaildLoginSignal;
}



- (void)setupUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.height.mas_equalTo(147);
        make.top.mas_equalTo(85);
    }];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btn.mas_bottom).offset(20);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1];
    [view addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(1);
        make.centerX.centerY.mas_equalTo(0);
    }];
    
    UITextField *userNameTextField = [[UITextField alloc] init];
    userNameTextField.borderStyle = UITextBorderStyleNone;
    userNameTextField.placeholder = @"GitHub userName or email";
    [view addSubview:userNameTextField];
    self.usernameTextField = userNameTextField;
    
    [userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30);
    }];
    
    
    UITextField *passwordTextField = [[UITextField alloc] init];
    passwordTextField.borderStyle = UITextBorderStyleNone;
    passwordTextField.placeholder = @"GitHub password";
    [view addSubview:passwordTextField];
    self.passwordTextField = passwordTextField;
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom).offset(10);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30);
    }];
    
    YS_Button *loginBtn = [YS_Button buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle: @"Log in" forState: UIControlStateNormal];
    [self.view addSubview:loginBtn];
    self.loginBtn = loginBtn;

    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view.mas_bottom).offset(30);
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.height.mas_equalTo(40);
    }];
}




- (void)createUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor purpleColor]];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(200);
    }];
    btn.rac_command = self.viewModel.loginCommand;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
