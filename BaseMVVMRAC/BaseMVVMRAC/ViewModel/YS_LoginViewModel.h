//
//  YS_LoginViewModel.h
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/7.
//  Copyright © 2019 demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YS_ViewModel.h"
#import <ReactiveObjC.h>
#import "YS_HomeViewModel.h"
#import "YS_ViewModelServices.h"

@interface YS_LoginViewModel : YS_ViewModel

@property (nonatomic, copy)NSString *username;
@property (nonatomic, copy)NSString *password;
@property (nonatomic, strong)RACSignal *vaildLoginSignal;
@property (nonatomic, strong, readwrite) RACCommand *loginCommand;


@end

