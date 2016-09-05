//
//  UIViewController+Common.m
//  YYQ2
//
//  Created by SNW on 16/4/4.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import "UIViewController+Common.h"
#import "YYQNavigationViewController.h"
#import "AppDelegate.h"

@implementation UIViewController (Common)
+ (UIViewController *)getCurrentVC{
    YYQNavigationViewController *nav = (YYQNavigationViewController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
    if (nav.presentedViewController && ![nav.presentedViewController isKindOfClass:[UIAlertController class]]) {
        //模态视图自带一个nav栈
        return [((YYQNavigationViewController *)nav.presentedViewController).viewControllers lastObject];
    }
    if ([nav respondsToSelector:@selector(viewControllers)]) {
        return [nav.viewControllers lastObject];
    }
    return nil;
}
@end