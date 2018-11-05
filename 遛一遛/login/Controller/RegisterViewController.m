//
//  RegisterViewController.m
//  遛一遛
//
//  Created by xiaowen on 2018/10/23.
//  Copyright © 2018年 xiaowenhuang. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterFetchModel.h"
#import "HomeViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)UIToolbar *bgToolBar;
@property(nonatomic,strong)UITextField *userNameField;
@property(nonatomic,strong)UIView *userNameLineView;
@property(nonatomic,strong)UITextField *passwordField;
@property(nonatomic,strong)UIView *passwordLineView;
@property(nonatomic,strong)UITextField *confirmPwField;
@property(nonatomic,strong)UIView *confirmLineView;

//@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *registerBtn;


@end

@implementation RegisterViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"注册";
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
        [_bgImageView setImage:[UIImage imageNamed:@"register"]];
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
        _passwordField.placeholder = @"输入密码";
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

-(UITextField *)confirmPwField{
    if(!_confirmPwField){
        _confirmPwField = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(self.passwordField.frame)+10, self.userNameField.frame.size.width, self.userNameField.frame.size.height)];
        _confirmPwField.textAlignment = NSTextAlignmentLeft;
        _confirmPwField.placeholder = @"确认密码";
        _confirmPwField.delegate = self;
        _confirmPwField.clearsOnBeginEditing = YES;
        _confirmPwField.secureTextEntry = YES;
    }
    return _confirmPwField;
}

-(UIView *)confirmLineView{
    if(!_confirmLineView){
        _confirmLineView = [[UIView alloc]initWithFrame:CGRectMake(self.confirmPwField.frame.origin.x, CGRectGetMaxY(self.confirmPwField.frame), self.confirmPwField.frame.size.width, 1)];
        _confirmLineView.backgroundColor = [UIColor grayColor];
    }
    return _confirmLineView;
}



-(UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc]init];
        _registerBtn.frame = CGRectMake(self.userNameField.frame.origin.x, CGRectGetMaxY(self.confirmPwField.frame)+10, self.userNameField.frame.size.width, 50);
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registerBtn.backgroundColor = [UIColor colorWithRed:225/255.0 green:202/255.0 blue:167/255.0 alpha:1];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _registerBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        _registerBtn.layer.masksToBounds = YES;
        _registerBtn.layer.cornerRadius = 5;
        
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
    [self.view addSubview:self.confirmPwField];
    [self.view addSubview:self.confirmLineView];
    [self.view addSubview:self.registerBtn];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(void)registerBtnClick{
    
    RegisterFetchModel *fetchModel = [[RegisterFetchModel alloc]init];
    fetchModel.phone = self.userNameField.text;
    fetchModel.password = self.passwordField.text;
    
    [HTTPTOOL registerWithRegisterFetchModel:fetchModel complete:^(BOOL *result) {
        if (result == true) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功!是否直接登录?" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                HomeViewController *vc = [[HomeViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
                
            }];
            UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:okAction];
            [alert addAction:cancleAction];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
    }];
}



-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.userNameField) {
        if (![self isValidateMobile:self.userNameField.text]) {
            [SVProgressHUD showInfoWithStatus:@"请输入正确的手机号！"];
            [SVProgressHUD dismissWithDelay:1.0f];
        }
    }
    if (textField == self.confirmPwField) {
        if (textField.text == self.passwordField.text) {
            
        }else{
            [SVProgressHUD showInfoWithStatus:@"两次密码不一致！"];
            [SVProgressHUD dismissWithDelay:1.0f];
            
            //self.confirmPwField.text == @"确认密码";
            //self.passwordField.text == @"输入密码";
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






















