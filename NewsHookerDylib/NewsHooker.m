//
//  NewsHooker.m
//  NewsHookerDylib
//
//  Created by 蓝布鲁 on 2018/4/29.
//  Copyright © 2018年 蓝布鲁. All rights reserved.
//

#import "NewsHooker.h"
#import "ANYMethodLog.h"
#import "MDMethodTrace.h"

@interface NewsHooker()

@property (nonatomic, strong) NSSet *blackList;

@end

@implementation NewsHooker

+ (instancetype)sharedInstance {
    static NewsHooker *instance;
    if (!instance) {
        instance = [[NewsHooker alloc] init];
    }
    return instance;
}

- (void)logMethod {
    [ANYMethodLog logMethodWithClass:NSClassFromString(@"NTESNBNewsListController")
                           condition:^BOOL(SEL sel) {
                               NSString *selString = NSStringFromSelector(sel);

                               for (NSString *blackString in self.blackList) {
                                   if([selString isEqualToString:blackString]) {
                                       return NO;
                                   }
                               }

                               return YES;

                           } before:^(id target, SEL sel, NSArray *args, int deep) {
                               NSLog(@"-----BF<%d>----- sel:%@ args:%@", deep, NSStringFromSelector(sel),args);
                           } after:^(id target, SEL sel, NSArray *args, NSTimeInterval interval, int deep, id retValue) {
                               NSLog(@"-----AF<%d>----- sel:%@ args:%@ retValue:%@", deep, NSStringFromSelector(sel),args, retValue);
                           }];
    
}

// bgAdImageView    pullDownAdExposeWithScrollView  checkAdExpose   pullDownAdInfo
-(NSSet *)blackList {
    if (!_blackList) {
        NSArray *array = @[@"removePlayer", @"removePlayerWithAdTag:",
                           @"resetCurrentPlayVideoInfo", @"setCurrentPlayVideoModel:",
                           @"setCurrentPlayVideoOriginData:", @"setCurrentPlayVideoCell:",
                           @"setVideoPlayer:", @"videoPlayer",
                           @"setEmbedBrowserAdVideoPlayStatus:", @"canPlayVideoWithModel:atIndexPath:",
                           @"videoIdWithModel:", @"viewModelAtIndexPath:",
                           @"articleRecordArr", @"scrollViewDidEndDecelerating:",
                           @"changeRocketToTranslucent:", @"needRefreshABTest",
                           @"checkNeedPlayVideo", @"newsListContentScrollPrefetchSinceOffset:",
                           @"scrollViewDidScroll:", @"checkNeedRemovePlayer",
                           @"currentPlayVideoOriginData", @"currentDisplayAdIndexPathes",
                           @"pullDownAdExposeWithScrollView:", @"bgAdImageView",
                           @"checkAdExpose", @"scrollViewWillBeginDragging:",
                           @"pullDownAdInfo", @"scrollViewDidEndDragging:willDecelerate:"];
        _blackList = [NSSet setWithArray:array];
    }
    return _blackList;
}
@end
