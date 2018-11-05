//
//  CurrentCon.m
//  ChinaSOS
//
//  Created by xiaowen on 2018/8/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "CurrentCon.h"

@interface CurrentCon()

@property(nonatomic,assign)ConImage conImage;

@end



static CurrentCon *_instance;

@implementation CurrentCon

+(CurrentCon *)shareInstance{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _instance = [[[self class] alloc]init];
    });
    return _instance;
}


-(ConImage)getCurrentConImage{
    
    return self.conImage;
    
}

-(void)setCurrentConImage:(ConImage)conImage{
    if (conImage) {
        self.conImage = conImage;
        NSLog(@"%ld~~~~~~~~~~~%ld",conImage,(long)_conImage);
    }
    
    
    
}



@end













