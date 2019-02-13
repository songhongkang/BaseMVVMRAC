//
//  YS_NavigationProtocol.h
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/4.
//  Copyright © 2019 demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YS_ViewModel.h"

@protocol YS_NavigationProtocol <NSObject>

- (void)resetRootViewModel:(YS_ViewModel *)viewModel;

- (void)pushViewModel:(YS_ViewModel *)viewModel animated:(BOOL)animated;
@end
