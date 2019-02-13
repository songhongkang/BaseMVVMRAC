//
//  YS_ViewController.h
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/7.
//  Copyright © 2019 demo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YS_ViewModel.h"


@interface YS_ViewController : UIViewController

@property (nonatomic, strong) YS_ViewModel *viewModel;


- (instancetype)initWithViewModel:(YS_ViewModel *)viewModel;


- (void)bingViewModel;
@end
