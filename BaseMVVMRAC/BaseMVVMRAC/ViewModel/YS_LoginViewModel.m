//
//  YS_LoginViewModel.m
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/7.
//  Copyright © 2019 demo. All rights reserved.
//

#import "YS_LoginViewModel.h"

@implementation YS_LoginViewModel

- (void)initialize
{
    [super initialize];

    @weakify(self);
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSLog(@"正在执行网络请求");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSLog(@"网络请求完成");
                if ([self.username isEqualToString:@"Admin"] && [self.password isEqualToString:@"123456"]) {
                    [subscriber sendNext:@"登录成功"];
                    YS_HomeViewModel *homeViewModel = [[YS_HomeViewModel alloc] initWithServices:self.services params:nil];
                    [self.services pushViewModel:homeViewModel animated:YES];
                }else{
                    [subscriber sendError:nil];
                }
                [subscriber sendCompleted];
            });
            return nil;
        }];

        return signal;
    }];
    

    self.vaildLoginSignal =   [[RACSignal combineLatest:@[RACObserve(self, username),RACObserve(self, password)] reduce:^(NSString *username, NSString *password){
        return @(username.length > 0 && password.length > 0);
    }] distinctUntilChanged];
    
}
@end
