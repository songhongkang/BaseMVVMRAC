//
//  YSConstant.h
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/4.
//  Copyright © 2019 demo. All rights reserved.
//

#ifndef YSConstant_h
#define YSConstant_h

#import "AppDelegate.h"
#import <ReactiveObjC.h>



#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

//#define Kappdelegate (AppDelegate *)[UIApplication sharedApplication].delegate

/// 少用宏，除了错误都不知道哈
///  上面的写法错误，多注意哈
#define Kappdelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define RGB(r, g, b) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#endif /* YSConstant_h */
