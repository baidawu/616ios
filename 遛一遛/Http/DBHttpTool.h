//
//  DBHttpTool.h
//  DuoBiaoEdu
//
//  Created by 黄爱鹏 on 2018/3/24.
//  Copyright © 2018年 fz985. All rights reserved.
//

#import <Foundation/Foundation.h>


@class LoginFetchModel;
@class RegisterFetchModel;

@protocol AddFriendDelegate<NSObject>



@end

@interface DBHttpTool : NSObject

+ (DBHttpTool *)shareInstance;

//注册
-(void)registerWithRegisterFetchModel:(RegisterFetchModel *)fetchModel complete:(void (^)(BOOL *))result;

//登录
-(void)loginWithLoginFetchModel:(LoginFetchModel *)fetchModel complete:(void (^)(BOOL *))result;




@end





































