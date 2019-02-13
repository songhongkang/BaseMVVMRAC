//
//  YS_TableViewModel.m
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/13.
//  Copyright © 2019 demo. All rights reserved.
//

#import "YS_TableViewModel.h"

@implementation YS_TableViewModel
- (void)initialize
{
    [super initialize];
    
    self.page  = 1;
    self.perPage = 100;
    
    self.requestRemoteDataCommad = [[RACCommand alloc] initWithSignalBlock:^RACSignal * (NSNumber *page) {
        return [[self requestRemoteDataSignalWithPage:page.unsignedIntegerValue] takeUntil:self.rac_willDeallocSignal];
    }];
    
//    [self.requestRemoteDataCommad.errors filter:^BOOL(NSError * _Nullable value) {
//        
//        return YES;
//    }] subscribe:<#(nonnull id<RACSubscriber>)#>
}

- (BOOL(^)(NSError *)

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page
{
    return [RACSignal empty];
}
@end
