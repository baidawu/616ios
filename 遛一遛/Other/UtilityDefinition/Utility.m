//
//  Utility.m
//  SimpleMethod
//
//  Created by xiaowen on 2018/9/6.
//  Copyright © 2018年 xiaowenhuang. All rights reserved.
//

#import "Utility.h"



@implementation Utility


#pragma mark - 十六进制字符串转化为Color
+(UIColor *)colorWithHexString:(NSString *)stringToConvert{
    
    if (stringToConvert)
    {
        return [UIColor clearColor];
    }
    
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];//字符串处理
    
    //例子，stringToConvert #ffffff
    if ([cString length] < 6)
        return [UIColor whiteColor];//如果非十六进制，返回白色
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];//去掉头
    if ([cString length] != 6 && [cString length] != 8)//去头非十六进制，返回白色
        return [UIColor whiteColor];
    
    //分别取RGB的值
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    
    unsigned int r, g, b, a;
    //NSScanner把扫描出的制定的字符串转换成Int类型
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    if (r > 255)
    {
        r = 255;
    }
    
    if (g > 255)
    {
        g = 255;
    }
    
    if (b > 255)
    {
        b = 255;
    }
    
    a = 255;
    if ([cString length] == 8) {
        
        range.location = 6;
        NSString *aString = [cString substringWithRange:range];
        [[NSScanner scannerWithString:aString] scanHexInt:&a];
    }
    
    //转换为UIColor
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:((float) a / 255.0f)];
    
    
}

//弹框：取消and确定
+(UIAlertController *)alertWithTitle:(NSString *)title message:(NSString *)message preferred:(UIAlertControllerStyle)preferred okAction:(void(^)(UIAlertAction *okAction))okAction cancleAction:(void(^)(UIAlertAction *cancleActon))cancleAction{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferred];
    
    UIAlertAction *okA = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:okAction];
    UIAlertAction *cancleA = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:cancleAction];
    
    [alert addAction:okA];
    [alert addAction:cancleA];
    
    return alert;
}

//获取当前时间
+(NSString *)getCurrentTime{
    
    NSDate *dateNow = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    //HH表示24小时制，hh表示12小时制
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    //设置时区
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    
    NSString *currentTime = [formatter stringFromDate:dateNow];
    
    return currentTime;
    
}

//返回当前时间戳
+(NSString *)getCurrentTimeStamp{

    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return timeSp;
}

//时间戳转为时间
+(NSString *)getTimeFromTimeStamp:(NSString *)timeStamp{

    // iOS 生成的时间戳是10位
    NSTimeInterval interval    =[timeStamp doubleValue];
    
    //NSTimeInterval interval    =[timeStamp doubleValue]/1000.0;
    
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];

    return dateString;
}




@end


























































