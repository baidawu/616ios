 //
//  AFRequestTool.m
//  HuaAnIpad
//
//  Created by Aipeng Huang on 2017/12/21.
//  Copyright © 2017年 HF. All rights reserved.
//

#import "AFRequestTool.h"
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>

#import "LoginFetchModel.h"
#import "RegisterFetchModel.h"



@implementation AFRequestTool

+(AFRequestTool *)shareInstance{
    static AFRequestTool *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc]init];
    });
    
    return instance;
}

+(void)requestWtihMethod:(RequestMethodType)methodType url:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    NSURL *baseURL = nil;
    BOOL isPreivateMode = NO;
    
    
    
#if 1
    isPreivateMode = YES;
#endif
    
    if (isPreivateMode) {
        baseURL = [NSURL URLWithString:@"http://47.107.59.252:8080/prj-sos/xiaowen/"];
    }else{
        baseURL = [NSURL URLWithString:@"http://47.107.59.252:8080/prj-sos/xiaowen/"];
    }
    
    //获得请求管理者（创建网络管理者）
    AFHTTPSessionManager *mgr = [[AFHTTPSessionManager alloc]initWithBaseURL:baseURL];
    mgr.responseSerializer.acceptableContentTypes=[mgr.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/plain",@"text/html",@"application/json",@"multipart/form-data"]];
    
        mgr.requestSerializer = [AFHTTPRequestSerializer serializer];//设置请求的数据格式
        mgr.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];//设置响应的数据格式
    
        mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
    
    
    [SVProgressHUD showWithStatus:@"加载中"];
    switch (methodType) {
            
        case RequestMethodTypeGet:
        {
            [mgr GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                //请求进度处理
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //成功回调
                [SVProgressHUD dismiss];
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"error=%@",error);
                //失败回调
               // [SVProgressHUD dismiss];
                if (failure) {
                    
                    failure(error);
                }
            }];
        }
            break;
        case RequestMethodTypePost:
        {
            
            [mgr POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //成功回调
                [SVProgressHUD dismiss];
                if (success) {
                    
                    if ([[responseObject objectForKey:@"msg"] isEqualToString:@"token无效"]) {
                        [[NSNotificationCenter defaultCenter]postNotificationName:@"tokenUnuser" object:nil userInfo:nil];
                    }else{
                        success(responseObject);

                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //失败回调
                [SVProgressHUD dismiss];
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        case POSTPicByData:
        {
            
             [SVProgressHUD showWithStatus:@"加载中"];
            [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                
                //上传文件参数
                NSArray *array = [params valueForKey:@"data"];
                for (int i = 0 ; i < array.count ; i++) {
                    NSData *imageData = [array objectAtIndex:i];
                    [formData appendPartWithFileData:imageData name:[params valueForKey:@"_name"] fileName:[params valueForKey:@"fileName"] mimeType:[params valueForKey:@"mimeType"]];
                }
                
                
                
//                [formData appendPartWithFileData:[params valueForKey:@"data"] name:[params valueForKey:@"name"] fileName:[params valueForKey:@"fileName"] mimeType:[params valueForKey:@"mimeType"]];
                
                
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                
                //打印上传进度
                CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
                //NSLog(@"！！！！！！！！！！！！！！%.2lf%%", progress);
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [SVProgressHUD dismiss];
                if (success) {
                    success(responseObject);
                }
                
                //请求成功
                //NSLog(@"请求成功：%@",responseObject);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [SVProgressHUD dismiss];
                if (failure) {
                    failure(error);
                }
                
                //请求失败
                //NSLog(@"请求失败：%@",error);
                
            }];
        }
            break;
        case POSTPicByBase:
        {
            
        }
            break;
        default:
            break;
    }
}

///注册
+(void)RegisterWithRegisterFetchModel:(RegisterFetchModel *_Nullable)registerFetchModel sucess:(void (^_Nullable)(id _Nullable))success failure:(void (^_Nullable)(NSError * _Nullable))failure{
    NSDictionary *params = @{
                             @"phone":registerFetchModel.phone,
                             @"password":registerFetchModel.password
                             };
    
    [AFRequestTool requestWtihMethod:RequestMethodTypePost url:@"sign" params:params success:^(id  _Nullable response) {
        success(response);
    } failure:^(NSError * _Nullable error) {
        failure(error);
    }];
}

///登陆
+(void)LoginWithLoginFetchModel:(LoginFetchModel *_Nullable)loginFetchModel sucess:(void (^_Nullable)(id _Nullable))success failure:(void (^_Nullable)(NSError * _Nullable))failure{
    NSDictionary *params = @{
                             @"phone":loginFetchModel.phone,
                             @"password":loginFetchModel.Password
                             };
    
    [AFRequestTool requestWtihMethod:RequestMethodTypePost url:@"login" params:params success:^(id  _Nullable response) {
        success(response);
    } failure:^(NSError * _Nullable error) {
        failure(error);
    }];
}




@end














