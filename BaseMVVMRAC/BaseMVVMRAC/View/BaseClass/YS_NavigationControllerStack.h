//
//  YS_NavigationControllerStack.h
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/5.
//  Copyright © 2019 demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YS_ViewModelServices.h"

@interface YS_NavigationControllerStack : NSObject

- (instancetype)initWithServices:(id<YS_ViewModelServices>)services;
@end
