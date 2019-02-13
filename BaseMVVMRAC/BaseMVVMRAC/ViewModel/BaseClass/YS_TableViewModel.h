//
//  YS_TableViewModel.h
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/13.
//  Copyright © 2019 demo. All rights reserved.
//

#import "YS_ViewModel.h"
#import <ReactiveObjC.h>


@interface YS_TableViewModel : YS_ViewModel

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) NSUInteger perPage;


@property (nonatomic, strong) RACCommand *didSelectCommand;
@property (nonatomic, strong) RACCommand *requestRemoteDataCommad;


- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page;

@end
