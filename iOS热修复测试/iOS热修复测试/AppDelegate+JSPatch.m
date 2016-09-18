//
//  AppDelegate+JSPatch.m
//  iOS热修复测试
//
//  Created by gaojun on 16/9/18.
//  Copyright © 2016年 gaojun. All rights reserved.
//


#import "define.h"
#import "AppDelegate+JSPatch.h"
#import "JSPatchPlatform/JSPatch.h"
@implementation AppDelegate (JSPatch)
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {
    [JSPatch setupLogger:^(NSString *log) {
        NSLog(@"替换JSPatch的输出－－－%@",log);
    }];
    
    [JSPatch setupCallback:^(JPCallbackType type, NSDictionary *data, NSError *error) {
        NSLog(@"type:%ld,data:%@,error:%@",(long)type,data,error);
    }];
    
    [JSPatch startWithAppKey:JSPatchAPPKey];
    
    [JSPatch setupRSAPublicKey:PublicKey];
    
    
#ifdef DEBUG
    [JSPatch setupDevelopment];
    
#endif
    
    [JSPatch sync];
    
    return YES;
}
@end
