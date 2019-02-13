//
//  YS_NavigationControllerStack.m
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/5.
//  Copyright © 2019 demo. All rights reserved.
//

#import "YS_NavigationControllerStack.h"
#import <ReactiveObjC.h>
#import "YS_Router.h"
#import "YSConstant.h"
#import "YS_NavigationController.h"

@interface YS_NavigationControllerStack()

//@property (nonatomic, strong) id<YS_ViewModelServices> services;
@property (nonatomic, strong, readwrite) id<YS_ViewModelServices> services;


@property (nonatomic, strong) NSMutableArray *navigationControllers;

@end

@implementation YS_NavigationControllerStack

- (instancetype)initWithServices:(id<YS_ViewModelServices>)services
{
    self = [super init];
    if (self == nil)  return nil;
    
    self.services = services;
    self.navigationControllers = [[NSMutableArray alloc] init];
    [self registerNavigationHooks];
    return self;
}


- (void)pushNavigationController:(UINavigationController *)navigatonController
{
    if ([self.navigationControllers containsObject:navigatonController])
        return;
    [self.navigationControllers addObject:navigatonController];
}


- (void)registerNavigationHooks
{
    
    [[(NSObject *)self.services rac_signalForSelector:@selector(pushViewModel:animated:)] subscribeNext:^(RACTuple * _Nullable x) {
        
        UIViewController *viewController = [[YS_Router sharedInstance] viewcontrollerForViewModel:x.first];
        UINavigationController *lastViewController = self.navigationControllers.lastObject;
        [lastViewController pushViewController:viewController animated:[x.second boolValue]];
        
    }];
    
    //    RACSignal
    [[(NSObject *)self.services rac_signalForSelector:@selector(resetRootViewModel:)] subscribeNext:^(RACTuple *  tuple) {
        [self.navigationControllers removeAllObjects];
        
      UIViewController *viewcontroller =   [YS_Router.sharedInstance viewcontrollerForViewModel:tuple.first];
        YS_NavigationController * nav;
        if (![viewcontroller isKindOfClass: [YS_NavigationController class]]) {
          nav = [[YS_NavigationController alloc] initWithRootViewController:viewcontroller];
            [self pushNavigationController:nav];
        }
        Kappdelegate.window.rootViewController = nav;
    }];
}
@end
