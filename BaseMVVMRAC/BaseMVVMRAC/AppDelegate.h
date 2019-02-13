//
//  AppDelegate.h
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/1.
//  Copyright © 2019 demo. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign)NetworkStatus networkStatus;

@property (nonatomic, strong) Reachability *reachability;

@end

