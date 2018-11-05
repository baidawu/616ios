//
//  ViewController.m
//  遛一遛
//
//  Created by xiaowen on 2018/10/22.
//  Copyright © 2018年 xiaowenhuang. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "LoginFetchModel.h"
#import "HomeViewController.h"

@interface ViewController ()<UITextFieldDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)UIToolbar *bgToolBar;
@property(nonatomic,strong)UITextField *userNameField;
@property(nonatomic,strong)UIView *userNameLineView;
@property(nonatomic,strong)UITextField *passwordField;
@property(nonatomic,strong)UIView *passwordLineView;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *registerBtn;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"遛一遛";
}

-(UIToolbar *)bgToolBar{
    if (!_bgToolBar) {
        _bgToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT)];
        _bgToolBar.barStyle = UIBarStyleBlackTranslucent;
        _bgToolBar.alpha = 0;
    }
    return _bgToolBar;
}

-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, NAV_BAR_HEIGHT, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT)];
        [_bgImageView setImage:[UIImage imageNamed:@"login"]];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageView.userInteractionEnabled = YES;
        
//        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//        UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
//
//        effectview.frame = CGRectMake(0, 0, _bgImageView.frame.size.width, CGRectGetHeight(_bgImageView.frame));
//        effectview.alpha = .6;
//        [_bgImageView addSubview:effectview];
        
       
        
    }
    return _bgImageView;
}


- (UITextField *)userNameField{
    if (!_userNameField) {
        _userNameField = [[UITextField alloc]initWithFrame:CGRectMake(50,NAV_BAR_HEIGHT+115 , UI_SCREEN_WIDTH-2*50, 50)];
        _userNameField.textAlignment = NSTextAlignmentLeft;
        _userNameField.placeholder  =@"用户名";
        _userNameField.delegate =self;
        _userNameField.clearsOnBeginEditing = YES;
        
//        _userNameField.layer.borderColor  =[UIColor grayColor].CGColor;
//        _userNameField.layer.borderWidth = 1.0;
        
        _userNameField.keyboardType = UIKeyboardTypePhonePad;
        
        
    }
    return _userNameField;
}

-(UIView *)userNameLineView{
    if (!_userNameLineView) {
        _userNameLineView = [[UIView alloc]initWithFrame:CGRectMake(self.userNameField.frame.origin.x, CGRectGetMaxY(self.userNameField.frame), self.userNameField.frame.size.width, 1)];
        _userNameLineView.backgroundColor = [UIColor grayColor];
    }
    return _userNameLineView;
}



-(UITextField *)passwordField{
    if (!_passwordField) {
        _passwordField = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(self.userNameField.frame)+10, self.userNameField.frame.size.width, self.userNameField.frame.size.height)];
        _passwordField.textAlignment = NSTextAlignmentLeft;
        _passwordField.placeholder = @"密码";
        _passwordField.delegate = self;
        _passwordField.clearsOnBeginEditing = YES;
        _passwordField.secureTextEntry = YES;
        
//        _passwordField.layer.borderColor  =[UIColor grayColor].CGColor;
//        _passwordField.layer.borderWidth = 1.0;
        
    }
    return _passwordField;
}

-(UIView *)passwordLineView{
    if (!_passwordLineView) {
        _passwordLineView = [[UIView alloc]initWithFrame:CGRectMake(self.passwordField.frame.origin.x, CGRectGetMaxY(self.passwordField.frame), self.passwordField.frame.size.width, 1)];
        _passwordLineView.backgroundColor = [UIColor grayColor];
        
    }
    return _passwordLineView;
}

-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc]init];
        _loginBtn.frame = CGRectMake(self.userNameField.frame.origin.x, CGRectGetMaxY(self.passwordField.frame)+20, self.userNameField.frame.size.width, self.userNameField.frame.size.height);
        _loginBtn.backgroundColor = [UIColor colorWithRed:225/255.0 green:202/255.0 blue:167/255.0 alpha:1];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius = 5;
        //_loginBtn.layer.borderWidth = 1.0;
        
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
    return _loginBtn;
}

-(UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc]init];
        _registerBtn.frame = CGRectMake(CGRectGetMaxX(self.userNameField.frame)-100, CGRectGetMaxY(self.loginBtn.frame)+5, 100, 50);
        [_registerBtn setTitle:@"我要注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor colorWithRed:225/255.0 green:202/255.0 blue:167/255.0 alpha:1] forState:UIControlStateNormal];
        _registerBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [_registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _registerBtn;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.bgImageView];
    [self.bgImageView addSubview:self.bgToolBar];
   // [self.view addSubview:self.bgToolBar];
    
    [self.view addSubview:self.userNameField];
    [self.view addSubview:self.userNameLineView];
    [self.view addSubview:self.passwordField];
    [self.view addSubview:self.passwordLineView];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.registerBtn];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}



-(void)loginBtnClick{
//    ViewController *vc = [[ViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    LoginFetchModel *fetchModel = [[LoginFetchModel alloc]init];
    fetchModel.phone = self.userNameField.text;
    fetchModel.Password = self.passwordField.text;
    
    [HTTPTOOL loginWithLoginFetchModel:fetchModel complete:^(BOOL *result) {
        if (result == true) {
            [SVProgressHUD showSuccessWithStatus:@"登录成功！"];
            [SVProgressHUD dismissWithDelay:1.0f];
            
            HomeViewController *vc = [[HomeViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }];
    
//    RegisterViewController *vc = [[RegisterViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)registerBtnClick{
    
    RegisterViewController *vc = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


#pragma mark textfield代理
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.userNameField) {
        if (![self isValidateMobile:self.userNameField.text]) {
            [SVProgressHUD showInfoWithStatus:@"请输入正确的手机号！"];
            [SVProgressHUD dismissWithDelay:1.0f];
        }
    }
}



//手机号码的正则表达式
-(BOOL)isValidateMobile:(NSString *)mobile{
    //手机号以13、15、18开头，八个\d数字字符
    NSString *phoneRegex = @"^((13[0-9])|(19[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,1,3,6,7,8])|(147))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}





@end



























