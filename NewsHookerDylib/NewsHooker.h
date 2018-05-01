//
//  NewsHooker.h
//  NewsHookerDylib
//
//  Created by 蓝布鲁 on 2018/4/29.
//  Copyright © 2018年 蓝布鲁. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsHooker : NSObject

+ (instancetype)sharedInstance;

- (void)logMethod;
@end
