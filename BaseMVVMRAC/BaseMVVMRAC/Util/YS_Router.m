//
//  YS_Router.m
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/7.
//  Copyright © 2019 demo. All rights reserved.
//

#import "YS_Router.h"

@interface YS_Router()

@property (nonatomic, copy) NSDictionary *viewModelViewMapppings;

@end

@implementation YS_Router

- (YS_ViewController *)viewcontrollerForViewModel:(YS_ViewModel *)viewModel
{
    NSString *viewController =self.viewModelViewMapppings[NSStringFromClass([viewModel class])];

   return  [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];    
}


+ (instancetype)sharedInstance
{
    static YS_Router *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


- (NSDictionary *)viewModelViewMapppings
{
    return @{
             @"YS_LoginViewModel":@"YS_LoginVC",
             @"YS_HomeViewModel":@"YS_HomeVC"
             };
}
@end
