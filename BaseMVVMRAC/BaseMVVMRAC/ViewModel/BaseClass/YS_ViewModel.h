//
//  YS_ViewModel.h
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/5.
//  Copyright © 2019 demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@protocol YS_ViewModelServices;

@interface YS_ViewModel : NSObject


@property (nonatomic, strong)NSString *title;

@property (nonatomic, assign)BOOL shouldRequestRemoteDataOnViewDidLoad;


@property (nonatomic, strong, readwrite) id<YS_ViewModelServices> services;

@property (nonatomic, strong) RACSubject *errors;


- (instancetype)initWithServices:(id<YS_ViewModelServices>)services params:(NSDictionary *)params;

- (void)initialize;
@end
