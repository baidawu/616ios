//
//  DBHttpTool.m
//  DuoBiaoEdu
//
//  Created by 黄爱鹏 on 2018/3/24.
//  Copyright © 2018年 fz985. All rights reserved.
//

#import "DBHttpTool.h"
#import "AFRequestTool.h"



static DBHttpTool *_instance;
@implementation DBHttpTool

+(DBHttpTool *)shareInstance{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _instance = [[[self class] alloc]init];
    });
    return _instance;
}


//注册
-(void)registerWithRegisterFetchModel:(RegisterFetchModel *)fetchModel complete:(void (^)(BOOL *))result{
    [AFRequestTool RegisterWithRegisterFetchModel:fetchModel sucess:^(id _Nullable response) {
        if ([[response objectForKey:@"code"] intValue]==0) {
            result(YES);
        }else{
            
            [SVProgressHUD showErrorWithStatus:[response objectForKey:@"msg"]];
            [SVProgressHUD setMaximumDismissTimeInterval:2.f];
            result(NO);
            
        }
    } failure:^(NSError * _Nullable err) {
        result(NO);
    }];
}

//登录
-(void)loginWithLoginFetchModel:(LoginFetchModel *)fetchModel complete:(void (^)(BOOL *))result{
    [AFRequestTool LoginWithLoginFetchModel:fetchModel sucess:^(id _Nullable response) {
        if ([[response objectForKey:@"code"] intValue]==0) {
            result(YES);
        }else{
            
            [SVProgressHUD showErrorWithStatus:[response objectForKey:@"msg"]];
            [SVProgressHUD setMaximumDismissTimeInterval:2.f];
            result(NO);
            
        }
    } failure:^(NSError * _Nullable err) {
        result(NO);
    }];

}







@end










