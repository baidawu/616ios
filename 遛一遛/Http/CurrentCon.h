//
//  CurrentCon.h
//  ChinaSOS
//
//  Created by xiaowen on 2018/8/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ConImage){
    
    viewController =0,
    helpViewController,
    setHelpController,
    historyViewController,
    meController,
    hospitalController,
    otherController,
    setMessageController,
    findPeopleController,
    tagController,
    searchNoticeController,
    friendController
    
};

@interface CurrentCon : NSObject

+(CurrentCon *)shareInstance;

-(ConImage)getCurrentConImage;

-(void)setCurrentConImage:(ConImage)conImage;

//设置当前控制器


//返回控制器


@end



