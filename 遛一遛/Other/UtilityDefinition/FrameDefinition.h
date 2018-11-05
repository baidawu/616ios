//
//  FrameDefinition.h
//  SimpleMethod
//
//  Created by xiaowen on 2018/9/6.
//  Copyright © 2018年 xiaowenhuang. All rights reserved.
//

#ifndef Header_h
#define Header_h

//屏幕宽高、尺寸
#define UI_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define UI_SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define UI_SCREEN_SIZE [UIScreen mainScreen].bounds.size

// 状态栏高度
#define STATUS_BAR_HEIGHT           [[UIApplication sharedApplication] statusBarFrame].size.height
// NavBar高度
#define NAV_BAR_HEIGHT   ([[UIApplication sharedApplication] statusBarFrame].size.height+44)
// TabBar高度
#define TAB_BAR_HEIGHT          49.0

#define HTTPTOOL [DBHttpTool shareInstance]



#endif /* Header_h */
