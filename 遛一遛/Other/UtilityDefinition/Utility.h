//
//  Utility.h
//  SimpleMethod
//
//  Created by xiaowen on 2018/9/6.
//  Copyright © 2018年 xiaowenhuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utility : NSObject

//十六进制字符串转为颜色
+(UIColor *)colorWithHexString:(NSString *)stringToConvert;



//弹框：取消and确定
+(UIAlertController *)alertWithTitle:(NSString *)title message:(NSString *)message preferred:(UIAlertControllerStyle)preferred okAction:(void(^)(UIAlertAction *okAction))okAction cancleAction:(void(^)(UIAlertAction *cancleActon))cancleAction;


//获取当前时间
+(NSString *)getCurrentTime;
//返回当前时间戳
+(NSString *)getCurrentTimeStamp;
//时间戳转为时间
+(NSString *)getTimeFromTimeStamp:(NSString *)timeStamp;

@end
