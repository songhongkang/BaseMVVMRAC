//
//  AppDelegate+YSHook.m
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/1.
//  Copyright © 2019 demo. All rights reserved.
//
#import "AppDelegate+YSHook.h"
#import <objc/runtime.h>
#import <Appirater/Appirater.h>
#import "Reachability.h"
#import <IQKeyboardManager.h>
#import <ReactiveObjC.h>
#import <AFNetworking.h>
#import <AFNetworkActivityIndicatorManager.h>



@implementation AppDelegate (YSHook)
///
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class selfClass = [self class];
        SEL oriSEL = @selector(application:didFinishLaunchingWithOptions:);
        //获取通过SEL获取一个方法
      Method oriMethod  =     class_getInstanceMethod(selfClass, oriSEL);
        
        SEL cusSEL = @selector(ys_application:didFinishLaunchingWithOptions:);
    
      Method cusMethod = class_getInstanceMethod(selfClass, cusSEL);
        
        BOOL addSucc = class_addMethod(selfClass, oriSEL, method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
    

        if (addSucc) {
            class_replaceMethod(selfClass, cusSEL, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
        }else{
            method_exchangeImplementations(oriMethod, cusMethod);
        }
    });
}

- (BOOL)ys_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self ys_application:application didFinishLaunchingWithOptions: launchOptions];    
    [self configureReachability];
    return YES;
}

- (void)configureAppearance {
    self.window.backgroundColor = [UIColor whiteColor];
    // 0x2F434F
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:(48 - 40) / 215.0 green:(67 - 40) / 215.0 blue:(78 - 40) / 215.0 alpha:1];
    [UINavigationBar appearance].barStyle  = UIBarStyleBlack;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    [UISegmentedControl appearance].tintColor = [UIColor whiteColor];
    
//    [UITabBar appearance].tintColor = HexRGB(colorI3);
}


- (void)configureKeyboardManager {
    /// 工具栏是否显示
    IQKeyboardManager.sharedManager.enableAutoToolbar = YES;
    /// 点击外部，键盘消失u
    IQKeyboardManager.sharedManager.shouldResignOnTouchOutside = YES;
}

//// 使用Appirater为APP添加评分功能
- (void)configureAppirater {
//    [Appirater setAppId:MRC_APP_ID];
    [Appirater setDaysUntilPrompt:7];
    [Appirater setUsesUntilPrompt:5];
    [Appirater setSignificantEventsUntilPrompt:-1];
    [Appirater setTimeBeforeReminding:2];
    [Appirater setDebug:NO];
    [Appirater appLaunched:YES];
}

/// 监听网络的变化
- (void)configureReachability
{
    
    AFNetworkActivityIndicatorManager.sharedManager.enabled = YES;

//    [[[[[NSNotificationCenter defaultCenter] rac_addObserverForName:kReachabilityChangedNotification object:nil] map:^id _Nullable(NSNotification * _Nullable value) {
//        Reachability *reachability = (Reachability *)value.object;
//        return @([reachability currentReachabilityStatus]);
//    }] distinctUntilChanged] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//        self.networkStatus = [x intValue];
//    }];
    
  RAC(self,networkStatus)  = [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:kReachabilityChangedNotification object:nil] map:^id _Nullable(NSNotification * _Nullable value) {
        Reachability *reachability = (Reachability *)value.object;
        return @([reachability currentReachabilityStatus]);
    }] distinctUntilChanged];
     
    self.reachability = [Reachability reachabilityWithHostName:@"https://www.baidu.com/"];
    [self.reachability startNotifier];
}

@end
