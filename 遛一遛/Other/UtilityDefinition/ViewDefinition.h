//
//  ViewDefinition.h
//  SimpleMethod
//
//  Created by xiaowen on 2018/9/6.
//  Copyright © 2018年 xiaowenhuang. All rights reserved.
//

#ifndef ViewDefinition_h
#define ViewDefinition_h

//1.设置RGB颜色/设置RGBA颜色
#define HXWRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HXWRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
//2.clear背景颜色
#define HXWClearColor [UIColor clearColor]

//3.获取当前语言
#define HXWCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])








#endif /* ViewDefinition_h */
