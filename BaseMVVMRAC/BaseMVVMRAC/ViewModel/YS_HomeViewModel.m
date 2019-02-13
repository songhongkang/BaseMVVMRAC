//
//  YS_HomeViewModel.m
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/8.
//  Copyright © 2019 demo. All rights reserved.
//

#import "YS_HomeViewModel.h"

@implementation YS_HomeViewModel

- (void)initialize
{
    [super initialize];
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page
{
    /// 进行网络请求
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"获取表格的网络数据");
            self.dataSource =@[@[@"1",@"2"],@[@"1",@"2",@"3"]];
            [subscriber sendNext:@"获取到最新数据"];
            [subscriber sendCompleted];
        });
        
        return nil;
    }];
    return signal;
}
@end
