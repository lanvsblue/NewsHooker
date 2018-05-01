//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  NewsHookerDylib.m
//  NewsHookerDylib
//
//  Created by 蓝布鲁 on 2018/4/26.
//  Copyright (c) 2018年 蓝布鲁. All rights reserved.
//

#import "NewsHookerDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import "NewsHooker.h"

CHDeclareClass(NTESNBNewsListController)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"


CHOptimizedMethod1(self, void, NTESNBNewsListController, didReceiveAdResponse, id , arg1) {
    return;
}

CHConstructor{
    CHLoadLateClass(NTESNBNewsListController);
    CHHook1(NTESNBNewsListController, didReceiveAdResponse);
    
//    [[NewsHooker sharedInstance] logMethod];
}

