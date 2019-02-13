//
//  YS_Button.m
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/11.
//  Copyright © 2019 demo. All rights reserved.
//

#import "YS_Button.h"
#import "YSConstant.h"
#import "YS_Util.h"

@implementation YS_Button

//+ (instancetype)buttonWithType:(UIButtonType)buttonType
//{
//    [self initialize];
//    return self;
//    YS_Button *btn  = [super buttonWithType:buttonType];
//    [self initialize];
//    return btn;
//}

- (instancetype)init
{
    self = [super init];
    if (self  == nil)  return nil;
    [self initialize];
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self == nil) return nil;
    [self initialize];
    return self;
}


- (UIColor *)titleColorForState:(UIControlState)state {
    switch (state) {
        case UIControlStateNormal:
        case UIControlStateHighlighted:
        case UIControlStateSelected:
        case UIControlStateApplication:
        case UIControlStateReserved:
            return HexRGB(0xffffff);
        case UIControlStateDisabled:
            return HexRGB(0xCFCFCF);
        default:
            break;
    }
    return nil;
}

- (UIImage *)backgroundImageForState:(UIControlState)state {
    switch (state) {
        case UIControlStateNormal:
            return HexRGB(0x576871).color2Image;
        case UIControlStateHighlighted:
        case UIControlStateSelected:
        case UIControlStateApplication:
        case UIControlStateReserved:
            return HexRGB(0x41525B).color2Image;
        case UIControlStateDisabled:
            return HexRGB(0x6D7E87).color2Image;
        default:
            break;
    }
    return nil;
}


- (void)initialize {
    self.layer.cornerRadius  = 3;
    self.layer.masksToBounds = YES;
    
    [self setBackgroundImage:[self backgroundImageForState:UIControlStateNormal] forState:UIControlStateNormal];
    [self setBackgroundImage:[self backgroundImageForState:UIControlStateDisabled] forState:UIControlStateDisabled];
    [self setBackgroundImage:[self backgroundImageForState:UIControlStateHighlighted] forState:UIControlStateHighlighted];
    
    [self setTitleColor:[self titleColorForState:UIControlStateNormal] forState:UIControlStateNormal];
    [self setTitleColor:[self titleColorForState:UIControlStateDisabled] forState:UIControlStateDisabled];
    [self setTitleColor:[self titleColorForState:UIControlStateHighlighted] forState:UIControlStateHighlighted];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
