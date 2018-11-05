//
//  LoginViewController.m
//  遛一遛
//
//  Created by xiaowen on 2018/10/22.
//  Copyright © 2018年 xiaowenhuang. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>


@property(nonatomic,strong)UITextField *userNameField;
@property(nonatomic,strong)UITextField *passwordField;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *registerBtn;

@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"登录";
}

- (UITextField *)userNameField{
    if (!_userNameField) {
        _userNameField = [[UITextField alloc]initWithFrame:CGRectMake(92,NAV_BAR_HEIGHT+115 , UI_SCREEN_WIDTH-2*92, 50)];
        _userNameField.textAlignment = NSTextAlignmentLeft;
        _userNameField.placeholder  =@"用户名";
        _userNameField.delegate =self;
        _userNameField.clearsOnBeginEditing = YES;
        
        
    }
    return _userNameField;
}

-(UITextField *)passwordField{
    if (!_passwordField) {
        _passwordField = [[UITextField alloc]initWithFrame:CGRectMake(92, CGRectGetMaxY(self.userNameField.frame)+20, self.userNameField.frame.size.width, self.userNameField.frame.size.height)];
        _passwordField.textAlignment = NSTextAlignmentLeft;
        _passwordField.placeholder = @"密码";
        _passwordField.delegate = self;
        _passwordField.clearsOnBeginEditing = YES;
    }
    return _passwordField;
}

-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc]init];
        _loginBtn.frame = CGRectMake(self.userNameField.frame.origin.x, CGRectGetMaxY(self.passwordField.frame)+20, self.userNameField.frame.size.width, self.userNameField.frame.size.height);
        _loginBtn.backgroundColor = [UIColor redColor];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius = 20;
        _loginBtn.layer.borderWidth = 1.0;
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
    return _loginBtn;
}

-(UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc]init];
        _registerBtn.frame = CGRectMake(CGRectGetMaxX(self.userNameField.frame)-50, CGRectGetMaxY(self.loginBtn.frame)+10, 50, 50);
        [_loginBtn setTitle:@"注册" forState:UIControlStateNormal];
        _loginBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [_registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _registerBtn;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.userNameField];
    [self.view addSubview:self.passwordField];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.registerBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)loginBtnClick{
    ViewController *vc = [[ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)registerBtnClick{
    RegisterViewController *vc = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}



@end






























