//
//  YS_ViewModel.m
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/5.
//  Copyright © 2019 demo. All rights reserved.
//

#import "YS_ViewModel.h"
#import "YS_ViewModelServices.h"


@interface YS_ViewModel()

@property (nonatomic, strong) NSDictionary *params;
@end

@implementation YS_ViewModel

////
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    YS_ViewModel *viewModel = [super allocWithZone:zone];
    @weakify(viewModel);
    
    [[viewModel rac_signalForSelector:@selector(initWithServices:params:)] subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(viewModel);
        [viewModel initialize];
    }];
    
    return viewModel;
}

- (instancetype)initWithServices:(id<YS_ViewModelServices>)services params:(NSDictionary *)params
{
    self = [super init];
    if (self == nil) return nil;
    self.services = services;
    self.params = params;
    self.title = params[@"title"];
    self.shouldRequestRemoteDataOnViewDidLoad = YES;
    return self;
}

- (RACSubject *)errors
{
    if (!_errors) {
        _errors = [RACSubject subject];
    }
    return _errors;
}

- (void)initialize{};
@end
