//
//  YS_ViewController.m
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/7.
//  Copyright © 2019 demo. All rights reserved.
//

#import "YS_ViewController.h"
#import <ReactiveObjC.h>


@interface YS_ViewController ()

@end

@implementation YS_ViewController


+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    YS_ViewController *viewController = [super allocWithZone:zone];
    
    @weakify(viewController);
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(RACTuple * _Nullable x) {
       @strongify(viewController);
        [viewController bingViewModel];
    }];
    return viewController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (instancetype)initWithViewModel:(YS_ViewModel *)viewModel
{
    self = [super init];
    if (self == nil) return nil;
    self.viewModel = viewModel;
    return self;
}


- (void)bingViewModel
{
    
}

@end
