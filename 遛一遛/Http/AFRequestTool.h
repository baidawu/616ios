//
//  AFRequestTool.h
//  HuaAnIpad
//
//  Created by Aipeng Huang on 2017/12/21.
//  Copyright © 2017年 HF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LoginFetchModel;
@class RegisterFetchModel;



typedef NS_ENUM(NSInteger,RequestMethodType){
    
    RequestMethodTypePost = 1,
    RequestMethodTypeGet = 2,
    POSTPicByData  = 3,
    POSTPicByBase
    
};


@interface AFRequestTool : NSObject


/**
 *  get请求
 *  发送一个请求
 *
 *  @param methodType   请求方法
 *  @param url          请求路径
 *  @param params       请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+(void)requestWtihMethod:(RequestMethodType)methodType
                     url:(NSString *_Nullable)url
                  params:(NSDictionary *_Nullable)params
                 success:(void (^_Nullable)(id _Nullable response))success
                 failure:(void (^_Nullable)(NSError * _Nullable error))failure;

//注册
+(void)RegisterWithRegisterFetchModel:(RegisterFetchModel *_Nullable)registerFetchModel sucess:(void (^_Nullable)(id _Nullable))success failure:(void (^_Nullable)(NSError * _Nullable))failure;


///登陆
+(void)LoginWithLoginFetchModel:(LoginFetchModel *_Nullable)loginFetchModel sucess:(void (^_Nullable)(id _Nullable))success failure:(void (^_Nullable)(NSError * _Nullable))failure;



@end













