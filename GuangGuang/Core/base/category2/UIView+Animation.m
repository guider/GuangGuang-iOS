//
//  UIView+Animation.m
//  YYQ2
//
//  Created by SNW on 16/3/15.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import "UIView+Animation.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Animation)
+(CABasicAnimation *)opacityForever_Animation:(float)time{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @1.0f;
    animation.toValue = @0.2;
    animation.autoreverses = YES;
    animation.duration = time;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    return animation;
}
@end
