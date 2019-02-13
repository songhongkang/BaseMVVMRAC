//
//  YS_Router.h
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/7.
//  Copyright © 2019 demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YS_ViewController.h"


@interface YS_Router : NSObject

+ (instancetype)sharedInstance;


- (YS_ViewController *)viewcontrollerForViewModel:(YS_ViewModel *)viewModel;

@end
