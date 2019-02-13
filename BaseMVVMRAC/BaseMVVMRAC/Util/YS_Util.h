//
//  YS_Util.h
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/11.
//  Copyright © 2019 demo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface YS_Util : NSObject

@end

@interface UIColor (Util)

/// Generating a new image by the color.
///
/// Returns a new image.
- (UIImage *)color2Image;
- (UIImage *)color2ImageSized:(CGSize)size;

@end
